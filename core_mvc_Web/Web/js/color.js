/**
 * Minified by jsDelivr using UglifyJS v3.3.22.
 * Original file: /npm/color-js@1.0.3/color.js
 * 
 * Do NOT use SRI with dynamically generated files! More information: https://www.jsdelivr.com/using-sri-with-dynamic-files
 */

if (void 0 === net) var net = {}; net.brehaut || (net.brehaut = {}), function () { "use strict"; var i = { aliceblue: "#F0F8FF", antiquewhite: "#FAEBD7", aqua: "#00FFFF", aquamarine: "#7FFFD4", azure: "#F0FFFF", beige: "#F5F5DC", bisque: "#FFE4C4", black: "#000000", blanchedalmond: "#FFEBCD", blue: "#0000FF", blueviolet: "#8A2BE2", brown: "#A52A2A", burlywood: "#DEB887", cadetblue: "#5F9EA0", chartreuse: "#7FFF00", chocolate: "#D2691E", coral: "#FF7F50", cornflowerblue: "#6495ED", cornsilk: "#FFF8DC", crimson: "#DC143C", cyan: "#00FFFF", darkblue: "#00008B", darkcyan: "#008B8B", darkgoldenrod: "#B8860B", darkgray: "#A9A9A9", darkgrey: "#A9A9A9", darkgreen: "#006400", darkkhaki: "#BDB76B", darkmagenta: "#8B008B", darkolivegreen: "#556B2F", darkorange: "#FF8C00", darkorchid: "#9932CC", darkred: "#8B0000", darksalmon: "#E9967A", darkseagreen: "#8FBC8F", darkslateblue: "#483D8B", darkslategray: "#2F4F4F", darkslategrey: "#2F4F4F", darkturquoise: "#00CED1", darkviolet: "#9400D3", deeppink: "#FF1493", deepskyblue: "#00BFFF", dimgray: "#696969", dimgrey: "#696969", dodgerblue: "#1E90FF", firebrick: "#B22222", floralwhite: "#FFFAF0", forestgreen: "#228B22", fuchsia: "#FF00FF", gainsboro: "#DCDCDC", ghostwhite: "#F8F8FF", gold: "#FFD700", goldenrod: "#DAA520", gray: "#808080", grey: "#808080", green: "#008000", greenyellow: "#ADFF2F", honeydew: "#F0FFF0", hotpink: "#FF69B4", indianred: "#CD5C5C", indigo: "#4B0082", ivory: "#FFFFF0", khaki: "#F0E68C", lavender: "#E6E6FA", lavenderblush: "#FFF0F5", lawngreen: "#7CFC00", lemonchiffon: "#FFFACD", lightblue: "#ADD8E6", lightcoral: "#F08080", lightcyan: "#E0FFFF", lightgoldenrodyellow: "#FAFAD2", lightgray: "#D3D3D3", lightgrey: "#D3D3D3", lightgreen: "#90EE90", lightpink: "#FFB6C1", lightsalmon: "#FFA07A", lightseagreen: "#20B2AA", lightskyblue: "#87CEFA", lightslategray: "#778899", lightslategrey: "#778899", lightsteelblue: "#B0C4DE", lightyellow: "#FFFFE0", lime: "#00FF00", limegreen: "#32CD32", linen: "#FAF0E6", magenta: "#FF00FF", maroon: "#800000", mediumaquamarine: "#66CDAA", mediumblue: "#0000CD", mediumorchid: "#BA55D3", mediumpurple: "#9370D8", mediumseagreen: "#3CB371", mediumslateblue: "#7B68EE", mediumspringgreen: "#00FA9A", mediumturquoise: "#48D1CC", mediumvioletred: "#C71585", midnightblue: "#191970", mintcream: "#F5FFFA", mistyrose: "#FFE4E1", moccasin: "#FFE4B5", navajowhite: "#FFDEAD", navy: "#000080", oldlace: "#FDF5E6", olive: "#808000", olivedrab: "#6B8E23", orange: "#FFA500", orangered: "#FF4500", orchid: "#DA70D6", palegoldenrod: "#EEE8AA", palegreen: "#98FB98", paleturquoise: "#AFEEEE", palevioletred: "#D87093", papayawhip: "#FFEFD5", peachpuff: "#FFDAB9", peru: "#CD853F", pink: "#FFC0CB", plum: "#DDA0DD", powderblue: "#B0E0E6", purple: "#800080", rebeccapurple: "#663399", red: "#FF0000", rosybrown: "#BC8F8F", royalblue: "#4169E1", saddlebrown: "#8B4513", salmon: "#FA8072", sandybrown: "#F4A460", seagreen: "#2E8B57", seashell: "#FFF5EE", sienna: "#A0522D", silver: "#C0C0C0", skyblue: "#87CEEB", slateblue: "#6A5ACD", slategray: "#708090", slategrey: "#708090", snow: "#FFFAFA", springgreen: "#00FF7F", steelblue: "#4682B4", tan: "#D2B48C", teal: "#008080", thistle: "#D8BFD8", tomato: "#FF6347", turquoise: "#40E0D0", violet: "#EE82EE", wheat: "#F5DEB3", white: "#FFFFFF", whitesmoke: "#F5F5F5", yellow: "#FFFF00", yellowgreen: "#9ACD32" }, e = "(?:\\+|-)?\\d+", t = "(?:\\+|-)?\\d*\\.\\d+", r = "(?:" + e + ")|(?:" + t + ")"; e = "(" + e + ")", t = "(" + t + ")"; var F, n = (r = "(" + r + ")") + "%", a = "\\s*?", h = new RegExp(["^hsl(a?)\\(", r, ",", n, ",", n, "(,(", r, "))?\\)$"].join(a)), s = new RegExp(["^rgb(a?)\\(", e, ",", e, ",", e, "(,(", r, "))?\\)$"].join(a)), u = new RegExp(["^rgb(a?)\\(", n, ",", n, ",", n, "(,(", r, "))?\\)$"].join(a)), c = [], g = {}; this.object || (this.object = function (e) { function t() { } return t.prototype = e, new t }); var f = this.object; function o(e, t) { e = e.toString(); for (var r = [], n = 0, a = Math.max(t - e.length, 0); n < a; n++)r.push("0"); return r.push(e), r.join("") } function p(e) { return e.slice(0, 1).toUpperCase() + e.slice(1) } function l(e) { return e.replace(/^\s+|\s+$/g, "") } function m(t) { return function () { var e = this.clone(); return t.apply(e, arguments), e } } function d(e, t) { var r = f(F), a = [], n = "to" + p(e); function i(e) { return function () { return e.apply(this[n](), arguments) } } for (var h in t) if (t.hasOwnProperty(h)) { r[h] = t[h]; var s = r[h]; if ("_" == h.slice(0, 1)) continue; if (h in F || "function" != typeof s) { if ("function" != typeof s) { a.push(h); var u = "get" + p(h), o = "set" + p(h); F[u] = i(r[u] = function (e) { return function () { return this[e] } }(h)), F[o] = i(r[o] = function (r) { return function (e) { var t = this.clone(); return t[r] = e, t } }(h)) } } else F[h] = i(s) } function l() { } function m() { return new l } return l.prototype = r, g[e] = m, r.clone = function () { for (var e = m(), t = 0, r = a.length; t < r; t++) { var n = a[t]; e[n] = this[n] } return e }, F[n] = function () { return m() }, c.push(r), r } F = { fromObject: function (e) { if (!e) return f(F); for (var t = 0, r = c.length; t < r; t++) { var n = c[t].fromObject(e); if (n) return n } return f(F) }, toString: function () { return this.toCSS() } }; var v = null; function b(e) { return F.fromObject(e) } d("RGB", { red: 0, green: 0, blue: 0, alpha: 0, getLuminance: function () { return .2126 * this.red + .7152 * this.green + .0722 * this.blue }, blend: function (e, t) { e = e.toRGB(), t = Math.min(Math.max(t, 0), 1); var r = this.clone(); return r.red = r.red * (1 - t) + e.red * t, r.green = r.green * (1 - t) + e.green * t, r.blue = r.blue * (1 - t) + e.blue * t, r.alpha = r.alpha * (1 - t) + e.alpha * t, r }, fromObject: function (e) { return e instanceof Array ? this._fromRGBArray(e) : "string" == typeof e ? this._fromCSS(l(e)) : e.hasOwnProperty("red") && e.hasOwnProperty("green") && e.hasOwnProperty("blue") ? this._fromRGB(e) : void 0 }, _stringParsers: [function (a) { a = l(a); var e = t(s, 255); return e || t(u, 100); function t(e, t) { var r = a.match(e); if (!r || !!r[1] + !!r[5] === 1) return null; var n = g.RGB(); return n.red = Math.min(1, Math.max(0, r[2] / t)), n.green = Math.min(1, Math.max(0, r[3] / t)), n.blue = Math.min(1, Math.max(0, r[4] / t)), n.alpha = r[5] ? Math.min(Math.max(parseFloat(r[6]), 0), 1) : 1, n } }, function (e) { var t = e.toLowerCase(); if (t in i && (e = i[t]), e.match(/^#([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$/)) { var r = (e = e.replace(/^#/, "")).length / 3, n = Math.pow(16, r) - 1, a = g.RGB(); return a.red = parseInt(e.slice(0, r), 16) / n, a.green = parseInt(e.slice(1 * r, 2 * r), 16) / n, a.blue = parseInt(e.slice(2 * r), 16) / n, a.alpha = 1, a } }, function (e) { if ("transparent" === e.toLowerCase()) return v }], _fromCSS: function (e) { for (var t = null, r = 0, n = this._stringParsers.length; r < n; r++)if (t = this._stringParsers[r](e)) return t }, _fromRGB: function (e) { var t = g.RGB(); return t.red = e.red, t.green = e.green, t.blue = e.blue, t.alpha = e.hasOwnProperty("alpha") ? e.alpha : 1, t }, _fromRGBArray: function (e) { var t = g.RGB(); return t.red = Math.max(0, Math.min(1, e[0] / 255)), t.green = Math.max(0, Math.min(1, e[1] / 255)), t.blue = Math.max(0, Math.min(1, e[2] / 255)), t.alpha = void 0 !== e[3] ? Math.max(0, Math.min(1, e[3])) : 1, t }, toCSSHex: function (e) { e = e || 2; var t = Math.pow(16, e) - 1; return ["#", o(Math.round(this.red * t).toString(16).toUpperCase(), e), o(Math.round(this.green * t).toString(16).toUpperCase(), e), o(Math.round(this.blue * t).toString(16).toUpperCase(), e)].join("") }, toCSS: function (e) { if (1 === this.alpha) return this.toCSSHex(e); return ["rgba(", Math.max(0, Math.min(255, Math.round(255 * this.red))), ",", Math.max(0, Math.min(255, Math.round(255 * this.green))), ",", Math.max(0, Math.min(255, Math.round(255 * this.blue))), ",", Math.max(0, Math.min(1, this.alpha)), ")"].join("") }, toHSV: function () { var e, t, r, n = g.HSV(); return e = Math.min(this.red, this.green, this.blue), t = Math.max(this.red, this.green, this.blue), 0 == (r = (n.value = t) - e) ? n.hue = n.saturation = 0 : (n.saturation = r / t, this.red == t ? n.hue = (this.green - this.blue) / r : this.green == t ? n.hue = 2 + (this.blue - this.red) / r : n.hue = 4 + (this.red - this.green) / r, n.hue = (60 * n.hue + 360) % 360), n.alpha = this.alpha, n }, toHSL: function () { return this.toHSV().toHSL() }, toRGB: function () { return this.clone() } }), v = F.fromObject({ red: 0, blue: 0, green: 0, alpha: 0 }), d("HSV", { hue: 0, saturation: 0, value: 1, alpha: 1, shiftHue: m(function (e) { var t = (this.hue + e) % 360; t < 0 && (t = (360 + t) % 360), this.hue = t }), devalueByAmount: m(function (e) { this.value = Math.min(1, Math.max(this.value - e, 0)) }), devalueByRatio: m(function (e) { this.value = Math.min(1, Math.max(this.value * (1 - e), 0)) }), valueByAmount: m(function (e) { this.value = Math.min(1, Math.max(this.value + e, 0)) }), valueByRatio: m(function (e) { this.value = Math.min(1, Math.max(this.value * (1 + e), 0)) }), desaturateByAmount: m(function (e) { this.saturation = Math.min(1, Math.max(this.saturation - e, 0)) }), desaturateByRatio: m(function (e) { this.saturation = Math.min(1, Math.max(this.saturation * (1 - e), 0)) }), saturateByAmount: m(function (e) { this.saturation = Math.min(1, Math.max(this.saturation + e, 0)) }), saturateByRatio: m(function (e) { this.saturation = Math.min(1, Math.max(this.saturation * (1 + e), 0)) }), schemeFromDegrees: function (e) { for (var t = [], r = 0, n = e.length; r < n; r++) { var a = this.clone(); a.hue = (this.hue + e[r]) % 360, t.push(a) } return t }, complementaryScheme: function () { return this.schemeFromDegrees([0, 180]) }, splitComplementaryScheme: function () { return this.schemeFromDegrees([0, 150, 320]) }, splitComplementaryCWScheme: function () { return this.schemeFromDegrees([0, 150, 300]) }, splitComplementaryCCWScheme: function () { return this.schemeFromDegrees([0, 60, 210]) }, triadicScheme: function () { return this.schemeFromDegrees([0, 120, 240]) }, clashScheme: function () { return this.schemeFromDegrees([0, 90, 270]) }, tetradicScheme: function () { return this.schemeFromDegrees([0, 90, 180, 270]) }, fourToneCWScheme: function () { return this.schemeFromDegrees([0, 60, 180, 240]) }, fourToneCCWScheme: function () { return this.schemeFromDegrees([0, 120, 180, 300]) }, fiveToneAScheme: function () { return this.schemeFromDegrees([0, 115, 155, 205, 245]) }, fiveToneBScheme: function () { return this.schemeFromDegrees([0, 40, 90, 130, 245]) }, fiveToneCScheme: function () { return this.schemeFromDegrees([0, 50, 90, 205, 320]) }, fiveToneDScheme: function () { return this.schemeFromDegrees([0, 40, 155, 270, 310]) }, fiveToneEScheme: function () { return this.schemeFromDegrees([0, 115, 230, 270, 320]) }, sixToneCWScheme: function () { return this.schemeFromDegrees([0, 30, 120, 150, 240, 270]) }, sixToneCCWScheme: function () { return this.schemeFromDegrees([0, 90, 120, 210, 240, 330]) }, neutralScheme: function () { return this.schemeFromDegrees([0, 15, 30, 45, 60, 75]) }, analogousScheme: function () { return this.schemeFromDegrees([0, 30, 60, 90, 120, 150]) }, fromObject: function (e) { if (e.hasOwnProperty("hue") && e.hasOwnProperty("saturation") && e.hasOwnProperty("value")) { var t = g.HSV(); return t.hue = e.hue, t.saturation = e.saturation, t.value = e.value, t.alpha = e.hasOwnProperty("alpha") ? e.alpha : 1, t } return null }, _normalise: function () { this.hue %= 360, this.saturation = Math.min(Math.max(0, this.saturation), 1), this.value = Math.min(Math.max(0, this.value)), this.alpha = Math.min(1, Math.max(0, this.alpha)) }, toRGB: function () { this._normalise(); var e, t, r, n, a, i = g.RGB(); if (0 === this.saturation) return i.red = this.value, i.green = this.value, i.blue = this.value, i.alpha = this.alpha, i; var h = this.hue / 60; switch (t = h - (e = Math.floor(h)), r = this.value * (1 - this.saturation), n = this.value * (1 - this.saturation * t), a = this.value * (1 - this.saturation * (1 - t)), e) { case 0: i.red = this.value, i.green = a, i.blue = r; break; case 1: i.red = n, i.green = this.value, i.blue = r; break; case 2: i.red = r, i.green = this.value, i.blue = a; break; case 3: i.red = r, i.green = n, i.blue = this.value; break; case 4: i.red = a, i.green = r, i.blue = this.value; break; default: i.red = this.value, i.green = r, i.blue = n }return i.alpha = this.alpha, i }, toHSL: function () { this._normalise(); var e = g.HSL(); e.hue = this.hue; var t = (2 - this.saturation) * this.value, r = this.saturation * this.value; return t && 2 - t && (r /= t <= 1 ? t : 2 - t), t /= 2, e.saturation = r, e.lightness = t, e.alpha = this.alpha, e }, toHSV: function () { return this.clone() } }), d("HSL", { hue: 0, saturation: 0, lightness: 0, alpha: 1, darkenByAmount: m(function (e) { this.lightness = Math.min(1, Math.max(this.lightness - e, 0)) }), darkenByRatio: m(function (e) { this.lightness = Math.min(1, Math.max(this.lightness * (1 - e), 0)) }), lightenByAmount: m(function (e) { this.lightness = Math.min(1, Math.max(this.lightness + e, 0)) }), lightenByRatio: m(function (e) { this.lightness = Math.min(1, Math.max(this.lightness * (1 + e), 0)) }), fromObject: function (e) { return "string" == typeof e ? this._fromCSS(e) : e.hasOwnProperty("hue") && e.hasOwnProperty("saturation") && e.hasOwnProperty("lightness") ? this._fromHSL(e) : void 0 }, _fromCSS: function (e) { var t = l(e).match(h); if (!t || !!t[1] + !!t[5] === 1) return null; var r = g.HSL(); return r.hue = (t[2] % 360 + 360) % 360, r.saturation = Math.max(0, Math.min(parseInt(t[3], 10) / 100, 1)), r.lightness = Math.max(0, Math.min(parseInt(t[4], 10) / 100, 1)), r.alpha = t[5] ? Math.max(0, Math.min(1, parseFloat(t[6]))) : 1, r }, _fromHSL: function (e) { var t = g.HSL(); return t.hue = e.hue, t.saturation = e.saturation, t.lightness = e.lightness, t.alpha = e.hasOwnProperty("alpha") ? e.alpha : 1, t }, _normalise: function () { this.hue = (this.hue % 360 + 360) % 360, this.saturation = Math.min(Math.max(0, this.saturation), 1), this.lightness = Math.min(Math.max(0, this.lightness)), this.alpha = Math.min(1, Math.max(0, this.alpha)) }, toHSL: function () { return this.clone() }, toHSV: function () { this._normalise(); var e = g.HSV(); e.hue = this.hue; var t = 2 * this.lightness, r = this.saturation * (t <= 1 ? t : 2 - t); return e.value = (t + r) / 2, e.saturation = 2 * r / (t + r) || 0, e.alpha = this.alpha, e }, toRGB: function () { return this.toHSV().toRGB() } }), b.isValid = function (e) { var t, r = b(e), n = 0; for (t in r) r.hasOwnProperty(t) && n++; return 0 < n }, net.brehaut.Color = b }.call(net.brehaut), "undefined" != typeof module && (module.exports = net.brehaut.Color);
 //# sourceMappingURL=/sm/1b8376e2ed7200fc83562978feb4abac6594f89d43e3d6494ca5fe6d6f47aa04.map