/*!
 * Viewer.js v0.8.0
 * https://github.com/fengyuanchen/viewerjs
 *
 * Copyright (c) 2015-2017 Fengyuan Chen
 * Released under the MIT license
 *
 * Date: 2017-10-08T11:45:00.656Z
 */

(function (global, factory) {
	typeof exports === 'object' && typeof module !== 'undefined' ? module.exports = factory() :
	typeof define === 'function' && define.amd ? define(factory) :
	(global.Viewer = factory());
}(this, (function () { 'use strict';

var DEFAULTS = {
  // Enable inline mode
  inline: false,

  // Show the button on the top-right of the viewer
  button: true,

  // Show the navbar
  navbar: true,

  // Show the title
  title: true,

  // Show the toolbar
  toolbar: true,

  // Show the tooltip with image ratio (percentage) when zoom in or zoom out
  tooltip: true,

  // Enable to move the image
  movable: true,

  // Enable to zoom the image
  zoomable: true,

  // Enable to rotate the image
  rotatable: true,

  // Enable to scale the image
  scalable: true,

  // Enable CSS3 Transition for some special elements
  transition: true,

  // Enable to request fullscreen when play
  fullscreen: true,

  // Enable keyboard support
  keyboard: true,

  // Define interval of each image when playing
  interval: 5000,

  // Min width of the viewer in inline mode
  minWidth: 200,

  // Min height of the viewer in inline mode
  minHeight: 100,

  // Define the ratio when zoom the image by wheeling mouse
  zoomRatio: 0.1,

  // Define the min ratio of the image when zoom out
  minZoomRatio: 0.01,

  // Define the max ratio of the image when zoom in
  maxZoomRatio: 100,

  // Define the CSS `z-index` value of viewer in modal mode.
  zIndex: 2015,

  // Define the CSS `z-index` value of viewer in inline mode.
  zIndexInline: 0,

  // Define where to get the original image URL for viewing
  // Type: String (an image attribute) or Function (should return an image URL)
  url: 'src',

  // Event shortcuts
  ready: null,
  show: null,
  shown: null,
  hide: null,
  hidden: null,
  view: null,
  viewed: null
};

var TEMPLATE = '<div class="viewer-container">' + '<div class="viewer-canvas"></div>' + '<div class="viewer-footer">' + '<div class="viewer-title"></div>' + '<ul class="viewer-toolbar">' + '<li role="button" class="viewer-zoom-in" data-action="zoom-in"></li>' + '<li role="button" class="viewer-zoom-out" data-action="zoom-out"></li>' + '<li role="button" class="viewer-one-to-one" data-action="one-to-one"></li>' + '<li role="button" class="viewer-reset" data-action="reset"></li>' + '<li role="button" class="viewer-prev" data-action="prev"></li>' + '<li role="button" class="viewer-play" data-action="play"></li>' + '<li role="button" class="viewer-next" data-action="next"></li>' + '<li role="button" class="viewer-rotate-left" data-action="rotate-left"></li>' + '<li role="button" class="viewer-rotate-right" data-action="rotate-right"></li>' + '<li role="button" class="viewer-flip-horizontal" data-action="flip-horizontal"></li>' + '<li role="button" class="viewer-flip-vertical" data-action="flip-vertical"></li>' + '</ul>' + '<div class="viewer-navbar">' + '<ul class="viewer-list"></ul>' + '</div>' + '</div>' + '<div class="viewer-tooltip"></div>' + '<div role="button" class="viewer-button" data-action="mix"></div>' + '<div class="viewer-player"></div>' + '</div>';

var _window = window;
var PointerEvent = _window.PointerEvent;


var NAMESPACE = 'viewer';

// Actions
var ACTION_MOVE = 'move';
var ACTION_SWITCH = 'switch';
var ACTION_ZOOM = 'zoom';

// Classes
var CLASS_ACTIVE = NAMESPACE + '-active';
var CLASS_CLOSE = NAMESPACE + '-close';
var CLASS_FADE = NAMESPACE + '-fade';
var CLASS_FIXED = NAMESPACE + '-fixed';
var CLASS_FULLSCREEN = NAMESPACE + '-fullscreen';
var CLASS_FULLSCREEN_EXIT = NAMESPACE + '-fullscreen-exit';
var CLASS_HIDE = NAMESPACE + '-hide';
var CLASS_HIDE_MD_DOWN = NAMESPACE + '-hide-md-down';
var CLASS_HIDE_SM_DOWN = NAMESPACE + '-hide-sm-down';
var CLASS_HIDE_XS_DOWN = NAMESPACE + '-hide-xs-down';
var CLASS_IN = NAMESPACE + '-in';
var CLASS_INVISIBLE = NAMESPACE + '-invisible';
var CLASS_MOVE = NAMESPACE + '-move';
var CLASS_OPEN = NAMESPACE + '-open';
var CLASS_SHOW = NAMESPACE + '-show';
var CLASS_TRANSITION = NAMESPACE + '-transition';

// Events
var EVENT_READY = 'ready';
var EVENT_SHOW = 'show';
var EVENT_SHOWN = 'shown';
var EVENT_HIDE = 'hide';
var EVENT_HIDDEN = 'hidden';
var EVENT_VIEW = 'view';
var EVENT_VIEWED = 'viewed';
var EVENT_CLICK = 'click';
var EVENT_DRAG_START = 'dragstart';
var EVENT_KEY_DOWN = 'keydown';
var EVENT_LOAD = 'load';
var EVENT_POINTER_DOWN = PointerEvent ? 'pointerdown' : 'touchstart mousedown';
var EVENT_POINTER_MOVE = PointerEvent ? 'pointermove' : 'mousemove touchmove';
var EVENT_POINTER_UP = PointerEvent ? 'pointerup pointercancel' : 'touchend touchcancel mouseup';
var EVENT_RESIZE = 'resize';
var EVENT_TRANSITION_END = 'transitionend';
var EVENT_WHEEL = 'wheel mousewheel DOMMouseScroll';

var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };

/**
 * Check if the given value is a string.
 * @param {*} value - The value to check.
 * @returns {boolean} Returns `true` if the given value is a string, else `false`.
 */
function isString(value) {
  return typeof value === 'string';
}

/**
 * Check if the given value is not a number.
 */
var isNaN = Number.isNaN || window.isNaN;

/**
 * Check if the given value is a number.
 * @param {*} value - The value to check.
 * @returns {boolean} Returns `true` if the given value is a number, else `false`.
 */
function isNumber(value) {
  return typeof value === 'number' && !isNaN(value);
}

/**
 * Check if the given value is undefined.
 * @param {*} value - The value to check.
 * @returns {boolean} Returns `true` if the given value is undefined, else `false`.
 */
function isUndefined(value) {
  return typeof value === 'undefined';
}

/**
 * Check if the given value is an object.
 * @param {*} value - The value to check.
 * @returns {boolean} Returns `true` if the given value is an object, else `false`.
 */
function isObject(value) {
  return (typeof value === 'undefined' ? 'undefined' : _typeof(value)) === 'object' && value !== null;
}

var hasOwnProperty = Object.prototype.hasOwnProperty;

/**
 * Check if the given value is a plain object.
 * @param {*} value - The value to check.
 * @returns {boolean} Returns `true` if the given value is a plain object, else `false`.
 */

function isPlainObject(value) {
  if (!isObject(value)) {
    return false;
  }

  try {
    var _constructor = value.constructor;
    var prototype = _constructor.prototype;


    return _constructor && prototype && hasOwnProperty.call(prototype, 'isPrototypeOf');
  } catch (e) {
    return false;
  }
}

/**
 * Check if the given value is a function.
 * @param {*} value - The value to check.
 * @returns {boolean} Returns `true` if the given value is a function, else `false`.
 */
function isFunction(value) {
  return typeof value === 'function';
}

/**
 * Iterate the given data.
 * @param {*} data - The data to iterate.
 * @param {Function} callback - The process function for each element.
 * @returns {*} The original data.
 */
function each(data, callback) {
  if (data && isFunction(callback)) {
    if (Array.isArray(data) || isNumber(data.length) /* array-like */) {
        var length = data.length;

        var i = void 0;

        for (i = 0; i < length; i += 1) {
          if (callback.call(data, data[i], i, data) === false) {
            break;
          }
        }
      } else if (isObject(data)) {
      Object.keys(data).forEach(function (key) {
        callback.call(data, data[key], key, data);
      });
    }
  }

  return data;
}

/**
 * Extend the given object.
 * @param {*} obj - The object to be extended.
 * @param {*} args - The rest objects which will be merged to the first object.
 * @returns {Object} The extended object.
 */
function extend(obj) {
  for (var _len = arguments.length, args = Array(_len > 1 ? _len - 1 : 0), _key = 1; _key < _len; _key++) {
    args[_key - 1] = arguments[_key];
  }

  if (isObject(obj) && args.length > 0) {
    if (Object.assign) {
      return Object.assign.apply(Object, [obj].concat(args));
    }

    args.forEach(function (arg) {
      if (isObject(arg)) {
        Object.keys(arg).forEach(function (key) {
          obj[key] = arg[key];
        });
      }
    });
  }

  return obj;
}

/**
 * Takes a function and returns a new one that will always have a particular context.
 * @param {Function} fn - The target function.
 * @param {Object} context - The new context for the function.
 * @returns {Function} The new function.
 */
function proxy(fn, context) {
  for (var _len2 = arguments.length, args = Array(_len2 > 2 ? _len2 - 2 : 0), _key2 = 2; _key2 < _len2; _key2++) {
    args[_key2 - 2] = arguments[_key2];
  }

  return function () {
    for (var _len3 = arguments.length, args2 = Array(_len3), _key3 = 0; _key3 < _len3; _key3++) {
      args2[_key3] = arguments[_key3];
    }

    return fn.apply(context, args.concat(args2));
  };
}

var REGEXP_SUFFIX = /^(width|height|left|top|marginLeft|marginTop)$/;

/**
 * Apply styles to the given element.
 * @param {Element} element - The target element.
 * @param {Object} styles - The styles for applying.
 */
function setStyle(element, styles) {
  var style = element.style;


  each(styles, function (value, property) {
    if (REGEXP_SUFFIX.test(property) && isNumber(value)) {
      value += 'px';
    }

    style[property] = value;
  });
}

/**
 * Get the styles from the given element.
 * @param {Element} element - The target element.
 * @returns {Object} The styles of the element.
 */
function getStyle(element) {
  return window.getComputedStyle ? window.getComputedStyle(element, null) : element.currentStyle;
}

/**
 * Check if the given element has a special class.
 * @param {Element} element - The element to check.
 * @param {string} value - The class to search.
 * @returns {boolean} Returns `true` if the special class was found.
 */
function hasClass(element, value) {
  return element.classList ? element.classList.contains(value) : element.className.indexOf(value) > -1;
}

/**
 * Add classes to the given element.
 * @param {Element} element - The target element.
 * @param {string} value - The classes to be added.
 */
function addClass(element, value) {
  if (!value) {
    return;
  }

  if (isNumber(element.length)) {
    each(element, function (elem) {
      addClass(elem, value);
    });
    return;
  }

  if (element.classList) {
    element.classList.add(value);
    return;
  }

  var className = element.className.trim();

  if (!className) {
    element.className = value;
  } else if (className.indexOf(value) < 0) {
    element.className = className + ' ' + value;
  }
}

/**
 * Remove classes from the given element.
 * @param {Element} element - The target element.
 * @param {string} value - The classes to be removed.
 */
function removeClass(element, value) {
  if (!value) {
    return;
  }

  if (isNumber(element.length)) {
    each(element, function (elem) {
      removeClass(elem, value);
    });
    return;
  }

  if (element.classList) {
    element.classList.remove(value);
    return;
  }

  if (element.className.indexOf(value) >= 0) {
    element.className = element.className.replace(value, '');
  }
}

/**
 * Add or remove classes from the given element.
 * @param {Element} element - The target element.
 * @param {string} value - The classes to be toggled.
 * @param {boolean} added - Add only.
 */
function toggleClass(element, value, added) {
  if (!value) {
    return;
  }

  if (isNumber(element.length)) {
    each(element, function (elem) {
      toggleClass(elem, value, added);
    });
    return;
  }

  // IE10-11 doesn't support the second parameter of `classList.toggle`
  if (added) {
    addClass(element, value);
  } else {
    removeClass(element, value);
  }
}

var REGEXP_HYPHENATE = /([a-z\d])([A-Z])/g;

/**
 * Hyphenate the given value.
 * @param {string} value - The value to hyphenate.
 * @returns {string} The hyphenated value.
 */
function hyphenate(value) {
  return value.replace(REGEXP_HYPHENATE, '$1-$2').toLowerCase();
}

/**
 * Get data from the given element.
 * @param {Element} element - The target element.
 * @param {string} name - The data key to get.
 * @returns {string} The data value.
 */
function getData(element, name) {
  if (isObject(element[name])) {
    return element[name];
  } else if (element.dataset) {
    return element.dataset[name];
  }

  return element.getAttribute('data-' + hyphenate(name));
}

/**
 * Set data to the given element.
 * @param {Element} element - The target element.
 * @param {string} name - The data key to set.
 * @param {string} data - The data value.
 */
function setData(element, name, data) {
  if (isObject(data)) {
    element[name] = data;
  } else if (element.dataset) {
    element.dataset[name] = data;
  } else {
    element.setAttribute('data-' + hyphenate(name), data);
  }
}

/**
 * Remove data from the given element.
 * @param {Element} element - The target element.
 * @param {string} name - The data key to remove.
 */
function removeData(element, name) {
  if (isObject(element[name])) {
    delete element[name];
  } else if (element.dataset) {
    // #128 Safari not allows to delete dataset property
    try {
      delete element.dataset[name];
    } catch (e) {
      element.dataset[name] = null;
    }
  } else {
    element.removeAttribute('data-' + hyphenate(name));
  }
}

var REGEXP_SPACES = /\s+/;

/**
 * Remove event listener from the given element.
 * @param {Element} element - The target element.
 * @param {string} type - The event type(s) to remove,
 * @param {Function} listener - The event listener to remove.
 * @param {Object} options - The event options.
 */
function removeListener(element, type, listener) {
  var options = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : {};

  var types = type.trim().split(REGEXP_SPACES);

  if (types.length > 1) {
    each(types, function (t) {
      removeListener(element, t, listener);
    });
    return;
  }

  if (isFunction(listener.onceListener)) {
    listener = listener.onceListener;
    delete listener.onceListener;
  }

  if (element.removeEventListener) {
    element.removeEventListener(type, listener, options);
  } else if (element.detachEvent) {
    element.detachEvent('on' + type, listener);
  }
}

/**
 * Add event listener to the given element.
 * @param {Element} element - The target element.
 * @param {string} type - The event type(s) to add,
 * @param {Function} listener - The event listener to add.
 * @param {Object} options - The event options.
 */
function addListener(element, type, listener) {
  var options = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : {};

  var types = type.trim().split(REGEXP_SPACES);

  if (types.length > 1) {
    each(types, function (t) {
      addListener(element, t, listener);
    });
    return;
  }

  if (options.once) {
    var originalListener = listener;
    var onceListener = function onceListener() {
      for (var _len4 = arguments.length, args = Array(_len4), _key4 = 0; _key4 < _len4; _key4++) {
        args[_key4] = arguments[_key4];
      }

      removeListener(element, type, onceListener);
      return originalListener.apply(element, args);
    };
    originalListener.onceListener = onceListener;
    listener = onceListener;
  }

  if (element.addEventListener) {
    element.addEventListener(type, listener, options);
  } else if (element.attachEvent) {
    element.attachEvent('on' + type, listener);
  }
}

/**
 * Dispatch event on the given element.
 * @param {Element} element - The target element.
 * @param {string} type - The event type(s) to dispatch,
 * @param {Object} data - The additional event data.
 * @returns {boolean} Indicate if the event is default prevented or not.
 */
function dispatchEvent(element, type, data) {
  if (element.dispatchEvent) {
    var event = void 0;

    // Event and CustomEvent on IE9-11 are global objects, not constructors
    if (isFunction(Event) && isFunction(CustomEvent)) {
      if (isUndefined(data)) {
        event = new Event(type, {
          bubbles: true,
          cancelable: true
        });
      } else {
        event = new CustomEvent(type, {
          detail: data,
          bubbles: true,
          cancelable: true
        });
      }
    } else if (isUndefined(data)) {
      event = document.createEvent('Event');
      event.initEvent(type, true, true);
    } else {
      event = document.createEvent('CustomEvent');
      event.initCustomEvent(type, true, true, data);
    }

    // IE9+
    return element.dispatchEvent(event);
  } else if (element.fireEvent) {
    // IE6-10 (native events only)
    return element.fireEvent('on' + type);
  }

  return true;
}

/**
 * Get the offset base on the document.
 * @param {Element} element - The target element.
 * @returns {Object} The offset data.
 */
function getOffset(element) {
  var doc = document.documentElement;
  var box = element.getBoundingClientRect();

  return {
    left: box.left + ((window.scrollX || doc && doc.scrollLeft || 0) - (doc && doc.clientLeft || 0)),
    top: box.top + ((window.scrollY || doc && doc.scrollTop || 0) - (doc && doc.clientTop || 0))
  };
}

/**
 * Empty an element.
 * @param {Element} element - The element to empty.
 */
function empty(element) {
  while (element.firstChild) {
    element.removeChild(element.firstChild);
  }
}

/**
 * Get transforms base on the given object.
 * @param {Object} obj - The target object.
 * @returns {string} A string contains transform values.
 */
function getTransforms(_ref) {
  var rotate = _ref.rotate,
      scaleX = _ref.scaleX,
      scaleY = _ref.scaleY;

  var values = [];

  if (isNumber(rotate) && rotate !== 0) {
    values.push('rotate(' + rotate + 'deg)');
  }

  if (isNumber(scaleX) && scaleX !== 1) {
    values.push('scaleX(' + scaleX + ')');
  }

  if (isNumber(scaleY) && scaleY !== 1) {
    values.push('scaleY(' + scaleY + ')');
  }

  var transform = values.length ? values.join(' ') : 'none';

  return {
    WebkitTransform: transform,
    msTransform: transform,
    transform: transform
  };
}

/**
 * Get an image name from an image url.
 * @param {string} url - The target url.
 * @example
 * // picture.jpg
 * getImageNameFromURL('http://domain.com/path/to/picture.jpg?size=1280×960')
 * @returns {string} A string contains the image name.
 */
function getImageNameFromURL(url) {
  return isString(url) ? url.replace(/^.*\//, '').replace(/[?&#].*$/, '') : '';
}

var IS_SAFARI_OR_UIWEBVIEW = navigator && /(Macintosh|iPhone|iPod|iPad).*AppleWebKit/i.test(navigator.userAgent);

/**
 * Get an image's natural sizes.
 * @param {string} image - The target image.
 * @param {Function} callback - The callback function.
 */
function getImageNaturalSizes(image, callback) {
  // Modern browsers (except Safari)
  if (image.naturalWidth && !IS_SAFARI_OR_UIWEBVIEW) {
    callback(image.naturalWidth, image.naturalHeight);
    return;
  }

  var newImage = document.createElement('img');

  newImage.onload = function () {
    callback(newImage.width, newImage.height);
  };

  newImage.src = image.src;
}

/**
 * Get the related class name of a responsive type number.
 * @param {string} type - The responsive type.
 * @returns {string} The related class name.
 */
function getResponsiveClass(type) {
  switch (type) {
    case 2:
      return CLASS_HIDE_XS_DOWN;

    case 3:
      return CLASS_HIDE_SM_DOWN;

    case 4:
      return CLASS_HIDE_MD_DOWN;

    default:
      return '';
  }
}

/**
 * Get the max ratio of a group of pointers.
 * @param {string} pointers - The target pointers.
 * @returns {number} The result ratio.
 */
function getMaxZoomRatio(pointers) {
  var pointers2 = extend({}, pointers);
  var ratios = [];

  each(pointers, function (pointer, pointerId) {
    delete pointers2[pointerId];

    each(pointers2, function (pointer2) {
      var x1 = Math.abs(pointer.startX - pointer2.startX);
      var y1 = Math.abs(pointer.startY - pointer2.startY);
      var x2 = Math.abs(pointer.endX - pointer2.endX);
      var y2 = Math.abs(pointer.endY - pointer2.endY);
      var z1 = Math.sqrt(x1 * x1 + y1 * y1);
      var z2 = Math.sqrt(x2 * x2 + y2 * y2);
      var ratio = (z2 - z1) / z1;

      ratios.push(ratio);
    });
  });

  ratios.sort(function (a, b) {
    return Math.abs(a) < Math.abs(b);
  });

  return ratios[0];
}

/**
 * Get a pointer from an event object.
 * @param {Object} event - The target event object.
 * @param {boolean} endOnly - Indicates if only returns the end point coordinate or not.
 * @returns {Object} The result pointer contains start and/or end point coordinates.
 */
function getPointer(_ref2, endOnly) {
  var pageX = _ref2.pageX,
      pageY = _ref2.pageY;

  var end = {
    endX: pageX,
    endY: pageY
  };

  if (endOnly) {
    return end;
  }

  return extend({
    startX: pageX,
    startY: pageY
  }, end);
}

/**
 * Get the center point coordinate of a group of pointers.
 * @param {Object} pointers - The target pointers.
 * @returns {Object} The center point coordinate.
 */
function getPointersCenter(pointers) {
  var pageX = 0;
  var pageY = 0;
  var count = 0;

  each(pointers, function (_ref3) {
    var startX = _ref3.startX,
        startY = _ref3.startY;

    pageX += startX;
    pageY += startY;
    count += 1;
  });

  pageX /= count;
  pageY /= count;

  return {
    pageX: pageX,
    pageY: pageY
  };
}

var render = {
  render: function render() {
    this.initContainer();
    this.initViewer();
    this.initList();
    this.renderViewer();
  },
  initContainer: function initContainer() {
    this.containerData = {
      width: window.innerWidth,
      height: window.innerHeight
    };
  },
  initViewer: function initViewer() {
    var options = this.options,
        parent = this.parent;

    var viewerData = void 0;

    if (options.inline) {
      viewerData = {
        width: Math.max(parent.offsetWidth, options.minWidth),
        height: Math.max(parent.offsetHeight, options.minHeight)
      };

      this.parentData = viewerData;
    }

    if (this.fulled || !viewerData) {
      viewerData = this.containerData;
    }

    this.viewerData = extend({}, viewerData);
  },
  renderViewer: function renderViewer() {
    if (this.options.inline && !this.fulled) {
      setStyle(this.viewer, this.viewerData);
    }
  },
  initList: function initList() {
    var _this = this;

    var element = this.element,
        options = this.options,
        list = this.list;

    var items = [];

    each(this.images, function (image, i) {
      var src = image.src;

      var alt = image.alt || getImageNameFromURL(src);
      var url = options.url;


      if (!src) {
        return;
      }

      if (isString(url)) {
        url = image.getAttribute(url);
      } else if (isFunction(url)) {
        url = url.call(image, image);
      }

      items.push('<li>' + '<img' + (' src="' + src + '"') + ' role="button"' + ' data-action="view"' + (' data-index="' + i + '"') + (' data-original-url="' + (url || src) + '"') + (' alt="' + alt + '"') + '>' + '</li>');
    });

    list.innerHTML = items.join('');

    each(list.getElementsByTagName('img'), function (image) {
      setData(image, 'filled', true);
      addListener(image, EVENT_LOAD, proxy(_this.loadImage, _this), {
        once: true
      });
    });

    this.items = list.getElementsByTagName('li');

    if (options.transition) {
      addListener(element, EVENT_VIEWED, function () {
        addClass(list, CLASS_TRANSITION);
      }, {
        once: true
      });
    }
  },
  renderList: function renderList(index) {
    var i = index || this.index;
    var width = this.items[i].offsetWidth || 30;
    var outerWidth = width + 1; // 1 pixel of `margin-left` width

    // Place the active item in the center of the screen
    setStyle(this.list, {
      width: outerWidth * this.length,
      marginLeft: (this.viewerData.width - width) / 2 - outerWidth * i
    });
  },
  resetList: function resetList() {
    empty(this.list);
    removeClass(this.list, CLASS_TRANSITION);
    setStyle({
      marginLeft: 0
    });
  },
  initImage: function initImage(callback) {
    var _this2 = this;

    var options = this.options,
        image = this.image,
        viewerData = this.viewerData;

    var footerHeight = this.footer.offsetHeight;
    var viewerWidth = viewerData.width;
    var viewerHeight = Math.max(viewerData.height - footerHeight, footerHeight);
    var oldImageData = this.ImageData || {};

    getImageNaturalSizes(image, function (naturalWidth, naturalHeight) {
      var aspectRatio = naturalWidth / naturalHeight;
      var width = viewerWidth;
      var height = viewerHeight;

      if (viewerHeight * aspectRatio > viewerWidth) {
        height = viewerWidth / aspectRatio;
      } else {
        width = viewerHeight * aspectRatio;
      }

      width = Math.min(width * 0.9, naturalWidth);
      height = Math.min(height * 0.9, naturalHeight);

      var imageData = {
        naturalWidth: naturalWidth,
        naturalHeight: naturalHeight,
        aspectRatio: aspectRatio,
        ratio: width / naturalWidth,
        width: width,
        height: height,
        left: (viewerWidth - width) / 2,
        top: (viewerHeight - height) / 2
      };
      var initialImageData = extend({}, imageData);

      if (options.rotatable) {
        imageData.rotate = oldImageData.rotate || 0;
        initialImageData.rotate = 0;
      }

      if (options.scalable) {
        imageData.scaleX = oldImageData.scaleX || 1;
        imageData.scaleY = oldImageData.scaleY || 1;
        initialImageData.scaleX = 1;
        initialImageData.scaleY = 1;
      }

      _this2.imageData = imageData;
      _this2.initialImageData = initialImageData;

      if (isFunction(callback)) {
        callback();
      }
    });
  },
  renderImage: function renderImage(callback) {
    var image = this.image,
        imageData = this.imageData;


    setStyle(image, extend({
      width: imageData.width,
      height: imageData.height,
      marginLeft: imageData.left,
      marginTop: imageData.top
    }, getTransforms(imageData)));

    if (isFunction(callback)) {
      if (this.transitioning) {
        addListener(image, EVENT_TRANSITION_END, callback, {
          once: true
        });
      } else {
        callback();
      }
    }
  },
  resetImage: function resetImage() {
    var image = this.image;

    // this.image only defined after viewed

    if (image) {
      image.parentNode.removeChild(image);
      this.image = null;
    }
  }
};

var events = {
  bind: function bind() {
    var element = this.element,
        options = this.options,
        viewer = this.viewer;


    if (isFunction(options.view)) {
      addListener(element, EVENT_VIEW, options.view);
    }

    if (isFunction(options.viewed)) {
      addListener(element, EVENT_VIEWED, options.viewed);
    }

    addListener(viewer, EVENT_CLICK, this.onClick = proxy(this.click, this));
    addListener(viewer, EVENT_WHEEL, this.onWheel = proxy(this.wheel, this));
    addListener(viewer, EVENT_DRAG_START, this.onDragStart = proxy(this.dragstart, this));
    addListener(this.canvas, EVENT_POINTER_DOWN, this.onPointerDown = proxy(this.pointerdown, this));
    addListener(document, EVENT_POINTER_MOVE, this.onPointerMove = proxy(this.pointermove, this));
    addListener(document, EVENT_POINTER_UP, this.onPointerUp = proxy(this.pointerup, this));
    addListener(document, EVENT_KEY_DOWN, this.onKeyDown = proxy(this.keydown, this));
    addListener(window, EVENT_RESIZE, this.onResize = proxy(this.resize, this));
  },
  unbind: function unbind() {
    var element = this.element,
        options = this.options,
        viewer = this.viewer;


    if (isFunction(options.view)) {
      removeListener(element, EVENT_VIEW, options.view);
    }

    if (isFunction(options.viewed)) {
      removeListener(element, EVENT_VIEWED, options.viewed);
    }

    removeListener(viewer, EVENT_CLICK, this.onClick);
    removeListener(viewer, EVENT_WHEEL, this.onWheel);
    removeListener(viewer, EVENT_DRAG_START, this.onDragStart);
    removeListener(this.canvas, EVENT_POINTER_DOWN, this.onPointerDown);
    removeListener(document, EVENT_POINTER_MOVE, this.onPointerMove);
    removeListener(document, EVENT_POINTER_UP, this.onPointerUp);
    removeListener(document, EVENT_KEY_DOWN, this.onKeyDown);
    removeListener(window, EVENT_RESIZE, this.onResize);
  }
};

var handlers = {
  click: function click(_ref) {
    var target = _ref.target;
    var imageData = this.imageData;

    var action = getData(target, 'action');

    switch (action) {
      case 'mix':
        if (this.played) {
          this.stop();
        } else if (this.options.inline) {
          if (this.fulled) {
            this.exit();
          } else {
            this.full();
          }
        } else {
          this.hide();
        }

        break;

      case 'view':
        this.view(getData(target, 'index'));
        break;

      case 'zoom-in':
        this.zoom(0.1, true);
        break;

      case 'zoom-out':
        this.zoom(-0.1, true);
        break;

      case 'one-to-one':
        this.toggle();
        break;

      case 'reset':
        this.reset();
        break;

      case 'prev':
        this.prev();
        break;

      case 'play':
        this.play();
        break;

      case 'next':
        this.next();
        break;

      case 'rotate-left':
        this.rotate(-90);
        break;

      case 'rotate-right':
        this.rotate(90);
        break;

      case 'flip-horizontal':
        this.scaleX(-imageData.scaleX || -1);
        break;

      case 'flip-vertical':
        this.scaleY(-imageData.scaleY || -1);
        break;

      default:
        if (this.played) {
          this.stop();
        }
    }
  },
  load: function load() {
    var _this = this;

    var options = this.options,
        image = this.image,
        index = this.index,
        viewerData = this.viewerData;


    if (this.timeout) {
      clearTimeout(this.timeout);
      this.timeout = false;
    }

    if (!image) {
      return;
    }

    removeClass(image, CLASS_INVISIBLE);

    image.style.cssText = 'width:0;' + 'height:0;' + ('margin-left:' + viewerData.width / 2 + 'px;') + ('margin-top:' + viewerData.height / 2 + 'px;') + 'max-width:none!important;' + 'visibility:visible;';

    this.initImage(function () {
      toggleClass(image, CLASS_TRANSITION, options.transition);
      toggleClass(image, CLASS_MOVE, options.movable);

      _this.renderImage(function () {
        _this.viewed = true;
        dispatchEvent(_this.element, EVENT_VIEWED, {
          originalImage: _this.images[index],
          index: index,
          image: image
        });
      });
    });
  },
  loadImage: function loadImage(e) {
    var image = e.target;
    var parent = image.parentNode;
    var parentWidth = parent.offsetWidth || 30;
    var parentHeight = parent.offsetHeight || 50;
    var filled = !!getData(image, 'filled');

    getImageNaturalSizes(image, function (naturalWidth, naturalHeight) {
      var aspectRatio = naturalWidth / naturalHeight;
      var width = parentWidth;
      var height = parentHeight;

      if (parentHeight * aspectRatio > parentWidth) {
        if (filled) {
          width = parentHeight * aspectRatio;
        } else {
          height = parentWidth / aspectRatio;
        }
      } else if (filled) {
        height = parentWidth / aspectRatio;
      } else {
        width = parentHeight * aspectRatio;
      }

      setStyle(image, {
        width: width,
        height: height,
        marginLeft: (parentWidth - width) / 2,
        marginTop: (parentHeight - height) / 2
      });
    });
  },
  keydown: function keydown(e) {
    var options = this.options;

    var key = e.keyCode || e.which || e.charCode;

    if (!this.fulled || !options.keyboard) {
      return;
    }

    switch (key) {
      // (Key: Esc)
      case 27:
        if (this.played) {
          this.stop();
        } else if (options.inline) {
          if (this.fulled) {
            this.exit();
          }
        } else {
          this.hide();
        }

        break;

      // (Key: Space)
      case 32:
        if (this.played) {
          this.stop();
        }

        break;

      // View previous (Key: ←)
      case 37:
        this.prev();
        break;

      // Zoom in (Key: ↑)
      case 38:

        // Prevent scroll on Firefox
        e.preventDefault();

        this.zoom(options.zoomRatio, true);
        break;

      // View next (Key: →)
      case 39:
        this.next();
        break;

      // Zoom out (Key: ↓)
      case 40:

        // Prevent scroll on Firefox
        e.preventDefault();

        this.zoom(-options.zoomRatio, true);
        break;

      // Zoom out to initial size (Key: Ctrl + 0)
      case 48:
      // Fall through

      // Zoom in to natural size (Key: Ctrl + 1)
      // eslint-disable-next-line
      case 49:
        if (e.ctrlKey || e.shiftKey) {
          e.preventDefault();
          this.toggle();
        }

        break;

      default:
    }
  },
  dragstart: function dragstart(e) {
    if (e.target.tagName.toLowerCase() === 'img') {
      e.preventDefault();
    }
  },
  pointerdown: function pointerdown(e) {
    var options = this.options,
        pointers = this.pointers;

	//added by Aniket 
    if(!this.options.movable)
		return;
	//end

    if (!this.viewed || this.transitioning) {
      return;
    }

    if (e.changedTouches) {
      each(e.changedTouches, function (touch) {
        pointers[touch.identifier] = getPointer(touch);
      });
    } else {
      pointers[e.pointerId || 0] = getPointer(e);
    }

    var action = options.movable ? ACTION_MOVE : false;

    if (Object.keys(pointers).length > 1) {
      action = ACTION_ZOOM;
    } else if ((e.pointerType === 'touch' || e.type === 'touchmove') && this.isSwitchable()) {
      action = ACTION_SWITCH;
    }

    this.action = action;
  },
  pointermove: function pointermove(e) {
    var options = this.options,
        pointers = this.pointers,
        action = this.action,
        image = this.image;

	//added by Aniket 
    if(!this.options.movable)
		return;
	//end

    if (!this.viewed || !action) {
      return;
    }

    e.preventDefault();

    if (e.changedTouches) {
      each(e.changedTouches, function (touch) {
        extend(pointers[touch.identifier], getPointer(touch, true));
      });
    } else {
      extend(pointers[e.pointerId || 0], getPointer(e, true));
    }

    if (action === ACTION_MOVE && options.transition && hasClass(image, CLASS_TRANSITION)) {
      removeClass(image, CLASS_TRANSITION);
    }

    this.change(e);
  },
  pointerup: function pointerup(e) {
    var action = this.action,
        pointers = this.pointers;


    if (!this.viewed) {
      return;
    }

    if (e.changedTouches) {
      each(e.changedTouches, function (touch) {
        delete pointers[touch.identifier];
      });
    } else {
      delete pointers[e.pointerId || 0];
    }

    if (!action) {
      return;
    }

    if (action === ACTION_MOVE && this.options.transition) {
      addClass(this.image, CLASS_TRANSITION);
    }

    this.action = false;
  },
  resize: function resize() {
    var _this2 = this;

    this.initContainer();
    this.initViewer();
    this.renderViewer();
    this.renderList();

    if (this.viewed) {
      this.initImage(function () {
        _this2.renderImage();
      });
    }

    if (this.played) {
      if (this.options.fullscreen && this.fulled && !document.fullscreenElement && !document.mozFullScreenElement && !document.webkitFullscreenElement && !document.msFullscreenElement) {
        this.stop();
        return;
      }

      each(this.player.getElementsByTagName('img'), function (image) {
        addListener(image, EVENT_LOAD, proxy(_this2.loadImage, _this2), {
          once: true
        });
        dispatchEvent(image, EVENT_LOAD);
      });
    }
  },
  start: function start(_ref2) {
    var target = _ref2.target;

    if (target.tagName.toLowerCase() === 'img') {
      this.target = target;
      this.show();
    }
  },
  wheel: function wheel(e) {
	 //added by Aniket 
    if(!this.options.zoomable)
		return;
	//end
				
	var _this3 = this;

    if (!this.viewed) {
      return;
    }

    e.preventDefault();

    // Limit wheel speed to prevent zoom too fast
    if (this.wheeling) {
      return;
    }

    this.wheeling = true;

    setTimeout(function () {
      _this3.wheeling = false;
    }, 50);

    var ratio = Number(this.options.zoomRatio) || 0.1;
    var delta = 1;

    if (e.deltaY) {
      delta = e.deltaY > 0 ? 1 : -1;
    } else if (e.wheelDelta) {
      delta = -e.wheelDelta / 120;
    } else if (e.detail) {
      delta = e.detail > 0 ? 1 : -1;
    }

    this.zoom(-delta * ratio, true, e);
  }
};

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) { arr2[i] = arr[i]; } return arr2; } else { return Array.from(arr); } }

var methods = {
  // Show the viewer (only available in modal mode)
  show: function show() {
    var _this = this;

    var element = this.element,
        options = this.options;


    if (options.inline || this.transitioning) {
      return this;
    }

    if (!this.ready) {
      this.build();
    }

    if (isFunction(options.show)) {
      addListener(element, EVENT_SHOW, options.show, {
        once: true
      });
    }

    if (dispatchEvent(element, EVENT_SHOW) === false) {
      return this;
    }

    this.open();

    var viewer = this.viewer;


    removeClass(viewer, CLASS_HIDE);
    addListener(element, EVENT_SHOWN, function () {
      _this.view(_this.target ? [].concat(_toConsumableArray(_this.images)).indexOf(_this.target) : _this.index);
      _this.target = false;
    }, {
      once: true
    });

    if (options.transition) {
      this.transitioning = true;
      addClass(viewer, CLASS_TRANSITION);

      // Force reflow to enable CSS3 transition
      // eslint-disable-next-line
      viewer.offsetWidth;
      addListener(viewer, EVENT_TRANSITION_END, proxy(this.shown, this), {
        once: true
      });
      addClass(viewer, CLASS_IN);
    } else {
      addClass(viewer, CLASS_IN);
      this.shown();
    }

    return this;
  },


  // Hide the viewer (only available in modal mode)
  hide: function hide() {
    var _this2 = this;

    var element = this.element,
        options = this.options,
        viewer = this.viewer;


    if (options.inline || this.transitioning || !this.visible) {
      return this;
    }

    if (isFunction(options.hide)) {
      addListener(element, EVENT_HIDE, options.hide, {
        once: true
      });
    }

    if (dispatchEvent(element, EVENT_HIDE) === false) {
      return this;
    }

    if (this.viewed && options.transition) {
      this.transitioning = true;
      addListener(this.image, EVENT_TRANSITION_END, function () {
        addListener(viewer, EVENT_TRANSITION_END, proxy(_this2.hidden, _this2), {
          once: true
        });
        removeClass(viewer, CLASS_IN);
      }, {
        once: true
      });
      this.zoomTo(0, false, false, true);
    } else {
      removeClass(viewer, CLASS_IN);
      this.hidden();
    }

    return this;
  },


  /**
   * View one of the images with image's index
   * @param {number} index - The index of the image to view.
   * @returns {Object} this
   */
  view: function view(index) {
    var _this3 = this;

    var element = this.element,
        title = this.title,
        canvas = this.canvas;


    index = Number(index) || 0;

    if (!this.ready || !this.visible || this.played || index < 0 || index >= this.length || this.viewed && index === this.index) {
      return this;
    }

    var item = this.items[index];
    var img = item.querySelector('img');
    var url = getData(img, 'originalUrl');
    var alt = img.getAttribute('alt');
    var image = document.createElement('img');

    image.src = url;
    image.alt = alt;

    if (dispatchEvent(element, EVENT_VIEW, {
      originalImage: this.images[index],
      index: index,
      image: image
    }) === false) {
      return this;
    }

    this.image = image;

    removeClass(this.items[this.index], CLASS_ACTIVE);
    addClass(item, CLASS_ACTIVE);

    this.viewed = false;
    this.index = index;
    this.imageData = null;

    addClass(image, CLASS_INVISIBLE);
    empty(canvas);
    canvas.appendChild(image);

    // Center current item
    this.renderList();

    // Clear title
    empty(title);

    // Generate title after viewed
    addListener(element, EVENT_VIEWED, function () {
      var imageData = _this3.imageData;


      title.textContent = alt + ' (' + imageData.naturalWidth + ' \xD7 ' + imageData.naturalHeight + ')';
    }, {
      once: true
    });

    if (image.complete) {
      this.load();
    } else {
      addListener(image, EVENT_LOAD, proxy(this.load, this), {
        once: true
      });

      if (this.timeout) {
        clearTimeout(this.timeout);
      }

      // Make the image visible if it fails to load within 1s
      this.timeout = setTimeout(function () {
        removeClass(image, CLASS_INVISIBLE);
        _this3.timeout = false;
      }, 1000);
    }

    return this;
  },


  // View the previous image
  prev: function prev() {
    this.view(Math.max(this.index - 1, 0));

    return this;
  },


  // View the next image
  next: function next() {
    this.view(Math.min(this.index + 1, this.length - 1));

    return this;
  },


  /**
   * Move the image with relative offsets.
   * @param {number} offsetX - The relative offset distance on the x-axis.
   * @param {number} offsetY - The relative offset distance on the y-axis.
   * @returns {Object} this
   */
  move: function move(offsetX, offsetY) {
    var imageData = this.imageData;


    this.moveTo(isUndefined(offsetX) ? offsetX : imageData.left + Number(offsetX), isUndefined(offsetY) ? offsetY : imageData.top + Number(offsetY));

    return this;
  },


  /**
   * Move the image to an absolute point.
   * @param {number} x - The x-axis coordinate.
   * @param {number} [y=x] - The y-axis coordinate.
   * @returns {Object} this
   */
  moveTo: function moveTo(x) {
    var y = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : x;
    var imageData = this.imageData;


    x = Number(x);
    y = Number(y);

    if (this.viewed && !this.played && this.options.movable) {
      var changed = false;

      if (isNumber(x)) {
        imageData.left = x;
        changed = true;
      }

      if (isNumber(y)) {
        imageData.top = y;
        changed = true;
      }

      if (changed) {
        this.renderImage();
      }
    }

    return this;
  },


  /**
   * Zoom the image with a relative ratio.
   * @param {number} ratio - The target ratio.
   * @param {boolean} [hasTooltip=false] - Indicates if it has a tooltip or not.
   * @param {Event} [_originalEvent=null] - The original event if any.
   * @returns {Object} this
   */
  zoom: function zoom(ratio) {
    var hasTooltip = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;

    var _originalEvent = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : null;

    var imageData = this.imageData;


    ratio = Number(ratio);

    if (ratio < 0) {
      ratio = 1 / (1 - ratio);
    } else {
      ratio = 1 + ratio;
    }

    this.zoomTo(imageData.width * ratio / imageData.naturalWidth, hasTooltip, _originalEvent);

    return this;
  },


  /**
   * Zoom the image to an absolute ratio.
   * @param {number} ratio - The target ratio.
   * @param {boolean} [hasTooltip=false] - Indicates if it has a tooltip or not.
   * @param {Event} [_originalEvent=null] - The original event if any.
   * @param {Event} [_zoomable=false] - Indicates if the current zoom is available or not.
   * @returns {Object} this
   */
  zoomTo: function zoomTo(ratio) {
    var hasTooltip = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;

    var _originalEvent = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : null;

    var _zoomable = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : false;

    var options = this.options,
        pointers = this.pointers,
        imageData = this.imageData;


    ratio = Math.max(0, ratio);

    if (isNumber(ratio) && this.viewed && !this.played && (_zoomable || options.zoomable)) {
      if (!_zoomable) {
        var minZoomRatio = Math.max(0.01, options.minZoomRatio);
        var maxZoomRatio = Math.min(100, options.maxZoomRatio);

        ratio = Math.min(Math.max(ratio, minZoomRatio), maxZoomRatio);
      }

      if (_originalEvent && ratio > 0.95 && ratio < 1.05) {
        ratio = 1;
      }

      var newWidth = imageData.naturalWidth * ratio;
      var newHeight = imageData.naturalHeight * ratio;

      if (_originalEvent) {
        var offset = getOffset(this.viewer);
        var center = pointers && Object.keys(pointers).length ? getPointersCenter(pointers) : {
          pageX: _originalEvent.pageX,
          pageY: _originalEvent.pageY
        };

        // Zoom from the triggering point of the event
        imageData.left -= (newWidth - imageData.width) * ((center.pageX - offset.left - imageData.left) / imageData.width);
        imageData.top -= (newHeight - imageData.height) * ((center.pageY - offset.top - imageData.top) / imageData.height);
      } else {
        // Zoom from the center of the image
        imageData.left -= (newWidth - imageData.width) / 2;
        imageData.top -= (newHeight - imageData.height) / 2;
      }

      imageData.width = newWidth;
      imageData.height = newHeight;
      imageData.ratio = ratio;
      this.renderImage();
	  
      if (hasTooltip) {
        this.tooltip();
      }
    }

    return this;
  },


  /**
   * Rotate the image with a relative degree.
   * @param {number} degree - The rotate degree.
   * @returns {Object} this
   */
  rotate: function rotate(degree) {
    this.rotateTo((this.imageData.rotate || 0) + Number(degree));

    return this;
  },


  /**
   * Rotate the image to an absolute degree.
   * @param {number} degree - The rotate degree.
   * @returns {Object} this
   */
  rotateTo: function rotateTo(degree) {
    var imageData = this.imageData;


    degree = Number(degree);

    if (isNumber(degree) && this.viewed && !this.played && this.options.rotatable) {
      imageData.rotate = degree;
      this.renderImage();
    }

    return this;
  },


  /**
   * Scale the image on the x-axis.
   * @param {number} scaleX - The scale ratio on the x-axis.
   * @returns {Object} this
   */
  scaleX: function scaleX(_scaleX) {
    this.scale(_scaleX, this.imageData.scaleY);

    return this;
  },


  /**
   * Scale the image on the y-axis.
   * @param {number} scaleY - The scale ratio on the y-axis.
   * @returns {Object} this
   */
  scaleY: function scaleY(_scaleY) {
    this.scale(this.imageData.scaleX, _scaleY);

    return this;
  },


  /**
   * Scale the image.
   * @param {number} scaleX - The scale ratio on the x-axis.
   * @param {number} [scaleY=scaleX] - The scale ratio on the y-axis.
   * @returns {Object} this
   */
  scale: function scale(scaleX) {
    var scaleY = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : scaleX;
    var imageData = this.imageData;


    scaleX = Number(scaleX);
    scaleY = Number(scaleY);

    if (this.viewed && !this.played && this.options.scalable) {
      var changed = false;

      if (isNumber(scaleX)) {
        imageData.scaleX = scaleX;
        changed = true;
      }

      if (isNumber(scaleY)) {
        imageData.scaleY = scaleY;
        changed = true;
      }

      if (changed) {
        this.renderImage();
      }
    }

    return this;
  },


  // Play the images
  play: function play() {
    var _this4 = this;

    var options = this.options,
        player = this.player;

    var load = proxy(this.loadImage, this);
    var list = [];
    var total = 0;
    var index = 0;

    if (!this.visible || this.played) {
      return this;
    }

    if (options.fullscreen) {
      this.requestFullscreen();
    }

    this.played = true;
    this.onLoadWhenPlay = load;
    addClass(player, CLASS_SHOW);

    each(this.items, function (item, i) {
      var img = item.querySelector('img');
      var image = document.createElement('img');

      image.src = getData(img, 'originalUrl');
      image.alt = img.getAttribute('alt');
      total += 1;

      addClass(image, CLASS_FADE);
      toggleClass(image, CLASS_TRANSITION, options.transition);

      if (hasClass(item, CLASS_ACTIVE)) {
        addClass(image, CLASS_IN);
        index = i;
      }

      list.push(image);
      addListener(image, EVENT_LOAD, load, {
        once: true
      });
      player.appendChild(image);
    });

    if (isNumber(options.interval) && options.interval > 0) {
      var playing = function playing() {
        _this4.playing = setTimeout(function () {
          removeClass(list[index], CLASS_IN);
          index += 1;
          index = index < total ? index : 0;
          addClass(list[index], CLASS_IN);

          playing();
        }, options.interval);
      };

      if (total > 1) {
        playing();
      }
    }

    return this;
  },


  // Stop play
  stop: function stop() {
    var _this5 = this;

    var player = this.player;


    if (!this.played) {
      return this;
    }

    if (this.options.fullscreen) {
      this.exitFullscreen();
    }

    this.played = false;
    clearTimeout(this.playing);
    each(this.player.getElementsByTagName('img'), function (image) {
      if (!image.complete) {
        removeListener(image, EVENT_LOAD, _this5.onLoadWhenPlay);
      }
    });
    removeClass(player, CLASS_SHOW);
    empty(player);

    return this;
  },


  // Enter modal mode (only available in inline mode)
  full: function full() {
    var _this6 = this;

    var options = this.options,
        viewer = this.viewer,
        image = this.image,
        list = this.list;


    if (!this.visible || this.played || this.fulled || !options.inline) {
      return this;
    }

    this.fulled = true;
    this.open();
    addClass(this.button, CLASS_FULLSCREEN_EXIT);

    if (options.transition) {
      removeClass(image, CLASS_TRANSITION);
      removeClass(list, CLASS_TRANSITION);
    }

    addClass(viewer, CLASS_FIXED);
    viewer.setAttribute('style', '');
    setStyle(viewer, {
      zIndex: options.zIndex
    });

    this.initContainer();
    this.viewerData = extend({}, this.containerData);
    this.renderList();
    this.initImage(function () {
      _this6.renderImage(function () {
        if (options.transition) {
          setTimeout(function () {
            addClass(image, CLASS_TRANSITION);
            addClass(list, CLASS_TRANSITION);
          }, 0);
        }
      });
    });

    return this;
  },


  // Exit modal mode (only available in inline mode)
  exit: function exit() {
    var _this7 = this;

    var options = this.options,
        viewer = this.viewer,
        image = this.image,
        list = this.list;


    if (!this.fulled) {
      return this;
    }

    this.fulled = false;
    this.close();
    removeClass(this.button, CLASS_FULLSCREEN_EXIT);

    if (options.transition) {
      removeClass(image, CLASS_TRANSITION);
      removeClass(list, CLASS_TRANSITION);
    }

    removeClass(viewer, CLASS_FIXED);
    setStyle(viewer, {
      zIndex: options.zIndexInline
    });

    this.viewerData = extend({}, this.parentData);
    this.renderViewer();
    this.renderList();
    this.initImage(function () {
      _this7.renderImage(function () {
        if (options.transition) {
          setTimeout(function () {
            addClass(image, CLASS_TRANSITION);
            addClass(list, CLASS_TRANSITION);
          }, 0);
        }
      });
    });

    return this;
  },


  // Show the current ratio of the image with percentage
  tooltip: function tooltip() {
    var _this8 = this;

    var options = this.options,
        tooltipBox = this.tooltipBox,
        imageData = this.imageData;


    if (!this.viewed || this.played || !options.tooltip) {
      return this;
    }

    tooltipBox.textContent = Math.round(imageData.ratio * 100) + '%';

    if (!this.tooltiping) {
      if (options.transition) {
        if (this.fading) {
          dispatchEvent(tooltipBox, EVENT_TRANSITION_END);
        }

        addClass(tooltipBox, CLASS_SHOW);
        addClass(tooltipBox, CLASS_FADE);
        addClass(tooltipBox, CLASS_TRANSITION);

        // Force reflow to enable CSS3 transition
        // eslint-disable-next-line
        tooltipBox.offsetWidth;
        addClass(tooltipBox, CLASS_IN);
      } else {
        addClass(tooltipBox, CLASS_SHOW);
      }
    } else {
      clearTimeout(this.tooltiping);
    }

    this.tooltiping = setTimeout(function () {
      if (options.transition) {
        addListener(tooltipBox, EVENT_TRANSITION_END, function () {
          removeClass(tooltipBox, CLASS_SHOW);
          removeClass(tooltipBox, CLASS_FADE);
          removeClass(tooltipBox, CLASS_TRANSITION);
          _this8.fading = false;
        }, {
          once: true
        });

        removeClass(tooltipBox, CLASS_IN);
        _this8.fading = true;
      } else {
        removeClass(tooltipBox, CLASS_SHOW);
      }

      _this8.tooltiping = false;
    }, 1000);

    return this;
  },


  // Toggle the image size between its natural size and initial size
  toggle: function toggle() {
    if (this.imageData.ratio === 1) {
      this.zoomTo(this.initialImageData.ratio, true);
    } else {
      this.zoomTo(1, true);
    }

    return this;
  },


  // Reset the image to its initial state
  reset: function reset() {
    if (this.viewed && !this.played) {
      this.imageData = extend({}, this.initialImageData);
      this.renderImage();
    }

    return this;
  },


  // Update viewer when images changed
  update: function update() {
    var _this9 = this;

    var indexes = [];

    // Destroy viewer if the target image was deleted
    if (this.isImg && !this.element.parentNode) {
      return this.destroy();
    }

    this.length = this.images.length;

    if (this.ready) {
      each(this.items, function (item, i) {
        var img = item.querySelector('img');
        var image = _this9.images[i];

        if (image) {
          if (image.src !== img.src) {
            indexes.push(i);
          }
        } else {
          indexes.push(i);
        }
      });

      setStyle(this.list, {
        width: 'auto'
      });

      this.initList();

      if (this.visible) {
        if (this.length) {
          if (this.viewed) {
            var index = indexes.indexOf(this.index);

            if (index >= 0) {
              this.viewed = false;
              this.view(Math.max(this.index - (index + 1), 0));
            } else {
              addClass(this.items[this.index], CLASS_ACTIVE);
            }
          }
        } else {
          this.image = null;
          this.viewed = false;
          this.index = 0;
          this.imageData = null;
          empty(this.canvas);
          empty(this.title);
        }
      }
    }

    return this;
  },


  // Destroy the viewer
  destroy: function destroy() {
    var element = this.element;


    if (this.options.inline) {
      this.unbind();
    } else {
      if (this.visible) {
        this.unbind();
      }

      removeListener(element, EVENT_CLICK, this.onStart);
    }

    this.unbuild();
    removeData(element, NAMESPACE);

    return this;
  }
};

var _window$1 = window;
var document$1 = _window$1.document;


var others = {
  open: function open() {
    var body = this.body;


    addClass(body, CLASS_OPEN);
    body.style.paddingRight = this.scrollbarWidth + 'px';
  },
  close: function close() {
    var body = this.body;


    removeClass(body, CLASS_OPEN);
    body.style.paddingRight = 0;
  },
  shown: function shown() {
    var element = this.element,
        options = this.options;


    this.transitioning = false;
    this.fulled = true;
    this.visible = true;
    this.render();
    this.bind();

    if (isFunction(options.shown)) {
      addListener(element, EVENT_SHOWN, options.shown, {
        once: true
      });
    }

    dispatchEvent(element, EVENT_SHOWN);
  },
  hidden: function hidden() {
    var element = this.element,
        options = this.options;


    this.transitioning = false;
    this.viewed = false;
    this.fulled = false;
    this.visible = false;
    this.unbind();
    this.close();
    addClass(this.viewer, CLASS_HIDE);
    this.resetList();
    this.resetImage();

    if (isFunction(options.hidden)) {
      addListener(element, EVENT_HIDDEN, options.hidden, {
        once: true
      });
    }

    dispatchEvent(element, EVENT_HIDDEN);
  },
  requestFullscreen: function requestFullscreen() {
    if (this.fulled && !document$1.fullscreenElement && !document$1.mozFullScreenElement && !document$1.webkitFullscreenElement && !document$1.msFullscreenElement) {
      var documentElement = document$1.documentElement;


      if (documentElement.requestFullscreen) {
        documentElement.requestFullscreen();
      } else if (documentElement.msRequestFullscreen) {
        documentElement.msRequestFullscreen();
      } else if (documentElement.mozRequestFullScreen) {
        documentElement.mozRequestFullScreen();
      } else if (documentElement.webkitRequestFullscreen) {
        documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
      }
    }
  },
  exitFullscreen: function exitFullscreen() {
    if (this.fulled) {
      if (document$1.exitFullscreen) {
        document$1.exitFullscreen();
      } else if (document$1.msExitFullscreen) {
        document$1.msExitFullscreen();
      } else if (document$1.mozCancelFullScreen) {
        document$1.mozCancelFullScreen();
      } else if (document$1.webkitExitFullscreen) {
        document$1.webkitExitFullscreen();
      }
    }
  },
  change: function change(e) {
    var pointers = this.pointers;

    var pointer = pointers[Object.keys(pointers)[0]];
    var offsetX = pointer.endX - pointer.startX;
    var offsetY = pointer.endY - pointer.startY;

    switch (this.action) {
      // Move the current image
      case ACTION_MOVE:
        this.move(offsetX, offsetY);
        break;

      // Zoom the current image
      case ACTION_ZOOM:
        this.zoom(getMaxZoomRatio(pointers), false, e);
        break;

      case ACTION_SWITCH:
        this.action = 'switched';

        if (Math.abs(offsetX) > Math.abs(offsetY)) {
          if (offsetX > 1) {
            this.prev();
          } else if (offsetX < -1) {
            this.next();
          }
        }

        break;

      default:
    }

    // Override
    each(pointers, function (p) {
      p.startX = p.endX;
      p.startY = p.endY;
    });
  },
  isSwitchable: function isSwitchable() {
    var imageData = this.imageData,
        viewerData = this.viewerData;


    return this.length > 1 && imageData.left >= 0 && imageData.top >= 0 && imageData.width <= viewerData.width && imageData.height <= viewerData.height;
  }
};

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var AnotherViewer = void 0;

var Viewer = function () {
  /**
   * Create a new Viewer.
   * @param {Element} element - The target element for viewing.
   * @param {Object} [options={}] - The configuration options.
   */
  function Viewer(element) {
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};

    _classCallCheck(this, Viewer);

    if (!element || element.nodeType !== 1) {
      throw new Error('The first argument is required and must be an element.');
    }

    this.element = element;
    this.options = extend({}, DEFAULTS, isPlainObject(options) && options);
    this.isImg = false;
    this.ready = false;
    this.visible = false;
    this.viewed = false;
    this.fulled = false;
    this.played = false;
    this.wheeling = false;
    this.playing = false;
    this.fading = false;
    this.tooltiping = false;
    this.transitioning = false;
    this.action = false;
    this.target = false;
    this.timeout = false;
    this.index = 0;
    this.length = 0;
    this.pointers = {};
    this.init();
  }

  _createClass(Viewer, [{
    key: 'init',
    value: function init() {
      var _this = this;

      var element = this.element,
          options = this.options;


      if (getData(element, NAMESPACE)) {
        return;
      }

      setData(element, NAMESPACE, this);

      var isImg = element.tagName.toLowerCase() === 'img';
      var images = isImg ? [element] : element.getElementsByTagName('img');
      var length = images.length;


      if (!length) {
        return;
      }

      if (isFunction(options.ready)) {
        addListener(element, EVENT_READY, options.ready, {
          once: true
        });
      }

      // Override `transition` option if it is not supported
      if (isUndefined(document.createElement(NAMESPACE).style.transition)) {
        options.transition = false;
      }

      this.isImg = isImg;
      this.length = length;
      this.count = 0;
      this.images = images;
      this.body = document.body;
      this.scrollbarWidth = window.innerWidth - document.body.clientWidth;

      if (options.inline) {
        var progress = proxy(this.progress, this);

        addListener(element, EVENT_READY, function () {
          _this.view();
        }, {
          once: true
        });

        each(images, function (image) {
          if (image.complete) {
            progress();
          } else {
            addListener(image, EVENT_LOAD, progress, {
              once: true
            });
          }
        });
      } else {
        addListener(element, EVENT_CLICK, this.onStart = proxy(this.start, this));
      }
    }
  }, {
    key: 'progress',
    value: function progress() {
      this.count += 1;

      if (this.count === this.length) {
        this.build();
      }
    }
  }, {
    key: 'build',
    value: function build() {
      var options = this.options;
      var element = this.element;


      if (this.ready) {
        return;
      }

      var parent = element.parentNode;
      var template = document.createElement('div');

      template.innerHTML = TEMPLATE;

      var viewer = template.querySelector('.' + NAMESPACE + '-container');
      var title = viewer.querySelector('.' + NAMESPACE + '-title');
      var toolbar = viewer.querySelector('.' + NAMESPACE + '-toolbar');
      var navbar = viewer.querySelector('.' + NAMESPACE + '-navbar');
      var button = viewer.querySelector('.' + NAMESPACE + '-button');

      this.parent = parent;
      this.viewer = viewer;
      this.title = title;
      this.toolbar = toolbar;
      this.navbar = navbar;
      this.button = button;
      this.canvas = viewer.querySelector('.' + NAMESPACE + '-canvas');
      this.footer = viewer.querySelector('.' + NAMESPACE + '-footer');
      this.tooltipBox = viewer.querySelector('.' + NAMESPACE + '-tooltip');
      this.player = viewer.querySelector('.' + NAMESPACE + '-player');
      this.list = viewer.querySelector('.' + NAMESPACE + '-list');

      addClass(title, !options.title ? CLASS_HIDE : getResponsiveClass(options.title));
      addClass(toolbar, !options.toolbar ? CLASS_HIDE : getResponsiveClass(options.toolbar));
      addClass(navbar, !options.navbar ? CLASS_HIDE : getResponsiveClass(options.navbar));
      toggleClass(button, CLASS_HIDE, !options.button);

      toggleClass(toolbar.querySelector('.' + NAMESPACE + '-one-to-one'), CLASS_INVISIBLE, !options.zoomable);
      toggleClass(toolbar.querySelectorAll('li[class*="zoom"]'), CLASS_INVISIBLE, !options.zoomable);
      toggleClass(toolbar.querySelectorAll('li[class*="flip"]'), CLASS_INVISIBLE, !options.scalable);

      if (!options.rotatable) {
        var rotates = toolbar.querySelectorAll('li[class*="rotate"]');

        addClass(rotates, CLASS_INVISIBLE);
        each(rotates, function (rotate) {
          toolbar.appendChild(rotate);
        });
      }

      if (options.inline) {
        addClass(button, CLASS_FULLSCREEN);
        setStyle(viewer, {
          zIndex: options.zIndexInline
        });

        if (getStyle(parent).position === 'static') {
          setStyle(parent, {
            position: 'relative'
          });
        }

        parent.insertBefore(viewer, element.nextSibling);
      } else {
        addClass(button, CLASS_CLOSE);
        addClass(viewer, CLASS_FIXED);
        addClass(viewer, CLASS_FADE);
        addClass(viewer, CLASS_HIDE);

        setStyle(viewer, {
          zIndex: options.zIndex
        });

        document.body.appendChild(viewer);
      }

      if (options.inline) {
        this.render();
        this.bind();
        this.visible = true;
      }

      this.ready = true;

      dispatchEvent(element, EVENT_READY);
    }
  }, {
    key: 'unbuild',
    value: function unbuild() {
      if (!this.ready) {
        return;
      }

      this.ready = false;
      this.viewer.parentNode.removeChild(this.viewer);
    }

    /**
     * Get the no conflict viewer class.
     * @returns {Viewer} The viewer class.
     */

  }], [{
    key: 'noConflict',
    value: function noConflict() {
      window.Viewer = AnotherViewer;
      return Viewer;
    }

    /**
     * Change the default options.
     * @param {Object} options - The new default options.
     */

  }, {
    key: 'setDefaults',
    value: function setDefaults(options) {
      extend(DEFAULTS, isPlainObject(options) && options);
    }
  }]);

  return Viewer;
}();

extend(Viewer.prototype, render, events, handlers, methods, others);

if (typeof window !== 'undefined') {
  AnotherViewer = window.Viewer;
  window.Viewer = Viewer;
}

return Viewer;

})));
