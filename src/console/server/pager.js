class Pager {
  constructor (defaults, sortFunc, filterFunc) {
    this.defaults  = defaults;
    this.sortFunc = sortFunc;
    this.filterFunc = filterFunc;
  }
  _createPagination (all, query) {
    let limit = this._parseInt(query.limit, this.defaults.limit);
    if (limit <= 0) {
      // Zero or negative
      limit = this.defaults.limit;
    }
    let offset = this.defaults.offset; // Items to skip
    let page = 0;
    if (query.page) {
      // pages to skip
      page = this._parseInt(query.page, page);
      if (page < 0) page = 0;
      offset = limit * page;
    } else {
      offset = this._parseInt(query.offset, this.defaults.offset);
      if (offset < 0) offset = 0;
      page = Math.floor(offset / limit);
    }
    let list = all.slice(offset, offset + limit);
    let pages = Math.ceil(all.length/limit);
    const obj = {
      paging: {
        offset: offset,
        limit: limit,
        page: page,
        size: list.length, // Included item
        total: all.length, // Total items
        pages: pages
      },
      data: list
    };
    return obj;  
  }
  _parseInt (expression, defaultValue) {
    if (typeof(expression) != "string") {
      return defaultValue;
    }
    const intValue = parseInt(expression);
    if (isNaN(intValue)) return defaultValue;
    return intValue;
  }
  _filter (all, query) {
    if (this.filterFunc) {
      return (this.filterFunc(all, query));
    }
    return all;
  }
  _sort(all, query) {
    let sortFunction = this.sortFunc[query.sort];
    if (sortFunction == null) {
      sortFunction = this.sortFunc[this.defaults.sort];
    }
    let isAsc = "asc" == query.order;
    return all.sort(
      (_a, _b)=>{
        let a = (isAsc)? _a:_b;
        let b = (isAsc)? _b:_a;
        return sortFunction(a, b);
      }
    );
  }
  getPagination (all, query) {
    let filtered = this._filter(all, query);
    let sorted = this._sort(filtered, query);
    return this._createPagination(sorted, query);
    
  }
}
module.exports = Pager;