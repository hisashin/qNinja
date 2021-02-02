// Tmp script for URL matching (for simple API)
var URL = require('url');

const PARTS_FIXED = 1;
const PARTS_PARAM = 2;
class Path {
  constructor (str, method, handler) {
    const tokens = str.split("/");
    this.expression = str;
    this.handler = handler;
    this.method = method;
    this.parts = tokens.map((token)=>{
      if (token.match(/\{(.+)\}/g)) {
        return {type:PARTS_PARAM, str:RegExp.$1};
      } else {
        return {type:PARTS_FIXED, str:token};
      }
    });
  }
  matches (url, method) {
    if (this.method != method) {
      return null;
    }
    const urlParts = url.split("/");
    if (urlParts.length != this.parts.length) {
      return null;
    }
    let params = [];
    for (let i=0; i<this.parts.length; i++) {
      let matcher = this.parts[i];
      if (matcher.type == PARTS_FIXED) {
        if (matcher.str != urlParts[i]) {
          return null;
        }
      }
      if (matcher.type == PARTS_PARAM) {
        params[matcher.str] = urlParts[i];
      }
    }
    return params;
  }
  document () {
    return {
      path: this.expression
    };
  }
}

class Router {
  constructor () {
    this.paths = [];
  }
  addPath (expression, method, handler) {
    this.paths.push(new Path(expression, method, handler));
  }
  add404 (handler) {
    this.handler404 = handler;
  }
  route (req, res) {
    const url = URL.parse(req.url).pathname;
    console.log(req.method + " " + req.url)
    for (let i=0; i<this.paths.length; i++) {
      let match = this.paths[i].matches(url, req.method);
      if (match != null) {
        return this.paths[i].handler(req, res, match);
      }
    }
    if (this.handler404) {
      this.handler404(req, res);
    } else {
      console.warn("Router.route handler404 is not defined.");
    }
  }
  list () {
    let items = [];
    this.paths.forEach((path)=>{
      items.push(path.document());
    });
    return items;
  }
  start () {
    // Sort (TODO: it's better to build path & method tree)
    this.paths.sort((a, b)=>{
    let count = Math.min(a.parts.length, b.parts.length);
    for (let i=0; i<count; i++) {
      let aPart = a.parts[i];
      let bPart = b.parts[i];
      if (aPart.type == PARTS_FIXED && bPart.type == PARTS_PARAM) {
        // A is prior
        return -1;
      }
      if (aPart.type == PARTS_PARAM && bPart.type == PARTS_FIXED) {
        // B is prior
        return 1;
      }
    }
    if (b.parts.length > a.parts.length) {
      // B is prior
      return 1;
    }
    if (a.parts.length > b.parts.length) {
      // B is prior
      return -1;
    }
    return 1;
    });
    for (let path of this.paths) {
      console.log(path.expression);
    }
  }
}

Router.test = ()=>{
  const router = new Router();
  router.addPath("/protocols", "GET", (req, res, map)=>{ console.log("List protocols") });
  router.addPath("/protocols/{pid}", "GET", (req, res, map)=>{ console.log("Get protocol:%s", map.pid) });
  router.addPath("/protocols/{pid}/run", "GET", (req, res, map)=>{ console.log("Run protocol:%s", map.pid) });
  router.add404((req, res)=>{ console.log("404 not found"); })
  
  let res = [];
  const tests = [
    "/protocols",
    "/protocols/ID244",
    "/protocols/ID244/run",
    "/protocols/ID244/run/ID444/puni",
  ];

  tests.forEach((url)=>{
    router.route({url:url, method:"GET"}, res, url);
  });
}
// Router.test();
module.exports = Router;