import sys
import json
import numpy as np
import matplotlib.pyplot as plt

# {u'step': 2, u'stage': 1, u't': 148571, u'repeat': 4, u'v': [0.4468781620182339, 0.3805895629158331, 0.3085171135123618, 0.27452598385616817, 0.23588818775576317, 0.18867349992591004, 0.1723089796631864, 0.16989265988581098]}

def calc_threshold (data, baseline_cycles, sigma_multiplier):
    base_range = data[0:baseline_cycles]
    baseline_factor = 0.95
    baseline = np.mean(base_range, axis=0) * baseline_factor
    threshold = np.log10(baseline + sigma_multiplier * np.std(base_range, axis=0))
    return threshold
    
def calc_ct (data_log, threshold):
    print(data_log.shape)
    tube_count = data_log.shape[1]
    cycle_count = data_log.shape[0]
    cts = []
    for tube_index in range(0, tube_count):
        ct = 0
        t = threshold[tube_index]
        for cycle in range(0, cycle_count-1):
            v = data_log[cycle][tube_index]
            v_next = data_log[cycle+1][tube_index]
            if v <= t and t < v_next:
                # Interpolation
                ct = cycle + (t - v) / (v_next - v)
                cts.append(ct)
                break
    print("Ct", cts)
    return cts
    
def calc_standard_curve (cts, quantities):
    A = np.vstack([quantities, np.ones(len(quantities))]).T
    # cts = m * standard_quantities + c
    m, c = np.linalg.lstsq(A, cts)[0]
    print(m, c)
    _ = plt.plot(quantities, cts, 'o', label='Original data', markersize=10)
    _ = plt.plot(quantities, m * quantities + c, 'r', label='Fitted line')
    _ = plt.legend()
    plt.show()
    return cts
    
def plot_fluorescence (data, thresholds):
    print(data)
    plt.plot(data)
    # plt.axhline(y=thresholds[0], color='r', linestyle='-')
    for t in thresholds:
        plt.axhline(y=t, color='r', linestyle='-')
    plt.show()
    
        
def analyze_qpcr (fl_log):
    tubes_count = 8
    standard_quantities = np.empty(tubes_count)
    
    # Dummy
    for i in range(0, tubes_count):
        standard_quantities[i] = 10.0 - i
        
    a = np.empty((0, tubes_count), int)
    for measurement in fl_log:
        if a.shape[0] <= measurement['repeat']:
            a = np.append(a, np.array([measurement['v']])[:,:tubes_count], axis=0)
    a_log = np.log10(a)
    print(a_log)
    threshold = calc_threshold(a, 2, 8)
    print(threshold)
    cts = calc_ct(a_log, threshold)
    print(standard_quantities)
    # calc_standard_curve(cts, standard_quantities)
    plot_fluorescence(a_log,threshold)
    

with open('./pcr_log.json') as f:
    log = json.load(f)
# for key in log:
#    print(key)
analyze_qpcr(log['fluorescence']['qpcr'])
