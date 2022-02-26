# Fluorescence measurement

## Sequence

1. Activate LED
    * Set potentiometer value
    * Select LED channel
2. Select photodiode MUX channel
    * Select MUX
    * Select channel
3. Read ADC value 
    * Wait until the ADC value becomes stable
    * Read ADC value

This sequence is performed for each channel.


# Wiring

* All I2C devices on the board share SDA and SCL wires.
* Device addresses
    * Potentiometer (For LED control) : 0x2F
    * LED driver : 0x05
    * ADC : 0x40
* Photodiodes
    * Wells and MUX channels association
        * North (Ch 0) (Well 1 - Well 8) 7,5,3,1,15,13,11,9
        * North (Ch 1) (Well 1 - Well 8) 6,4,2,0,14,12,10,8
        * South (Ch 0) (Well 9 - Well 16) 8,10,12,14,0,2,4,6
        * South (Ch 1) (Well 9 - Well 16) 9,11,13,15,1,3,5,7
* LED and driver channels association
    * North (Well 1 - Well 8) 11,10,9,8,12,13,14,15,
    * South (Well 9 - Well 16) 4,5,6,7,3,2,1,0
    
# Pseudo code

## Setup
```

pin_mux_select = ...
pin_mux_s0 = ...
pin_mux_s1 = ...
pin_mux_s2 = ...
pin_mux_s3 = ...

well_to_led_ch = [
    11,10,9,8,12,13,14,15,
    4,5,6,7,3,2,1,0
]

well_to_mux_ch = [
    [ 
        7,5,3,1,15,13,11,9, #  North
        8,10,12,14,0,2,4,6 # South
    ], # Optical channnel 0
    [
        6,4,2,0,14,12,10,8, #  North
        9,11,13,15,1,3,5,7 # South
    ] # Optical channnel 1
]

func setup () : 
    init_i2c_bus()
    led_driver_init()
    adc_init()
```

## Measure all Wells

```
for well in 0..15 :
    for optical_channel in 0..1 :
        fluo = read_fluo (well, optical_channel)

func read_fluo (well, optical_channel) :

    led_channel = well_to_led_ch[well]
    mux = (int) well / 8  # 0=>North, 1=>South
    mux_channel = well_to_mux_ch[optical_channel][well]

    set_potentiometer_wiper (pot_wiper)
    select_led_channel (led_channel)
    gpio_write (pin_mux_select, mux)
    select_mux_channel (mux_channel)
    adc_select_channel () # AIN3->P, AIN2->N
    delay_msec (2)
    fluo_raw = adc_read_conversion ()
    return calc_fluo (fluo_raw, pot_wiper)
```


## MUX
```
func select_mux_channel (channel) :
    gpio_write (pin_mux_s0, 0x01&(ch>>0) )
    gpio_write (pin_mux_s1, 0x01&(ch>>1) )
    gpio_write (pin_mux_s2, 0x01&(ch>>2) )
    gpio_write (pin_mux_s3, 0x01&(ch>>3) )

```
## LED driver
```
i2c_addr_led_driver = 0x05
REG_ADDR_LEDOUT0 = 0x02

func led_driver_init () :
    # Set blank control mode
    i2c_write(i2c_addr_led_driver, [0x00, 0b10001001] )

    first_val = 0x18 | (0b01 << 7)
    vals = [first_val]
    for 0..16
        vals.append(0xFF)
    # Send 17 bytes (address + 0xFF x 16)
    i2c_write(i2c_addr_led_driver, vals)

func select_led_channel (channel) :
    leds = [...]
    for i in 0..15
        leds[i] = (i == channel) ? 1 : 0

    vals = []

    # 4 bytes for 16 channels
    for group in 0..3
        # 2 bits for each channel
        val = 0b00000000
        for i in 0..3
            mode = leds[group * 4 + i]
            val = val | (mode << (i*2))
        vals[group] = val

    addr_byte = REG_ADDR_LEDOUT0 | (0b01 << 7)

    # Send 5 bytes (address + LED values)
    reg_values = [addr_byte] + [vals] 
    i2c_write(i2c_addr_led_driver, reg_values)

```
## Potentiometer
```
i2c_addr_pot = 0x2F

func set_potentiometer_wiper (wiper) : 
    val0 = wiper >> 8 & 0x01
    val1 = wiper & 0xFF
    i2c_write(i2c_addr_pot, [val0, val1]);

```

## ADC

```
i2c_addr_adc = 0x40

COMMAND_RDATA = 0x10
COMMAND_RREG = 0b00100000 # 0010 rrxx : Read register at address rr
COMMAND_WREG = 0b01000000
COMMAND_SSYNC = 0b00001000

func adc_write_reg (reg_address, value) :
    command = COMMAND_WREG | (0b11&reg_address) << 2;
    i2c_write(i2c_addr_adc, [command, value])
    i2c_send(i2c_addr_adc, COMMAND_SSYNC)

func adc_read_reg (address) :
    command = COMMAND_RREG | (0b11&addr) << 2;
    i2c_send(i2c_addr_adc, command)
    return i2c_receive(i2c_addr_adc)

func adc_init () :
    data_rate_600sps = 0b101
    current_conf_val = adc_read_reg(0x01);
    new_conf_val = (0b00011111 & current_conf_val) | (data_rate_600sps << 5)
    adc_write_reg(0x01, new_conf_val)

func adc_select_channel () :
    mux_bits = 0b0111 # AIN3->P, AIN2->N
    current_val = adc_read_reg(0x00)
    new_val = (0b00001111 & current_val) | (mux_bits << 4);
    adc_write_reg(0x00, new_val);

func adc_read_conversion () : 
    i2c_send(i2c_addr_adc, COMMAND_RDATA)

    # Read 3 bytes
    val = i2c_receive(i2c_addr_adc)
    val <<= 8;
    val |= i2c_receive(i2c_addr_adc)
    val <<= 8;
    val |= i2c_receive(i2c_addr_adc)

    if (val & 0x00800000)
      val = ~val + 1;
      val = -(val & 0xFFFFFF)
    return val / (1.0 * 0x00800000)

func calc_fluo (fluo_raw, pot_wiper) :
    # TODO

```
