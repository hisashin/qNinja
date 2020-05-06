import { store } from 'react-easy-state'

const AppState = store({
  ws : null,
  user: null,
  ws_response: {},
  isAuthenticated: false,
  AlertBanner : {visible : false, color : 'light', text : ''},
  // connected_class: "text-danger",
  set_ws(websocket){
    AppState.ws = websocket;
    if(websocket){
      AppState.connected_class = 'text-success';
    }else{
      AppState.connected_class = 'text-danger';
    }
  },
  get_ws() {
    return AppState.ws;
  },
  set_prop(key, val){
    console.log('AppState - setting', key, '=', val)
    AppState[key] = val;
  }
})

export default AppState