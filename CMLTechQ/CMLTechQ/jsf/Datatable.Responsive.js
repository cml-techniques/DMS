﻿/*! SmartAdmin - v1.5 - 2014-09-27 */
"use strict";

function ResponsiveDatatablesHelper(a, b, c) {
    this.tableElement = "string" == typeof a ? $(a) : a, this.api = this.tableElement.dataTable().api(), this.columnIndexes = [], this.columnsShownIndexes = [], this.columnsHiddenIndexes = [], this.currentBreakpoint = "", this.lastBreakpoint = "", this.lastColumnsHiddenIndexes = [];
    var d = window.location.pathname.split("/").pop(),
        e = this.api.settings().context[0];
    this.tableId = e.sTableId, this.saveState = e.oInit.bStateSave, this.cookieName = "DataTablesResponsiveHelper_" + this.tableId + (d ? "_" + d : ""), this.lastStateExists = !1, this.expandColumn = void 0, this.origBreakpointsDefs = void 0, this.breakpoints = {}, this.options = {
        "hideEmptyColumnsInRowDetail": !1,
        "clickOn": "icon",
        "showDetail": null,
        "hideDetail": null
    }, this.expandIconTemplate = '<span class="responsiveExpander"></span>', this.rowTemplate = '<tr class="row-detail"><td><ul><!--column item--></ul></td></tr>', this.rowLiTemplate = '<li><span class="columnTitle"><!--column title--></span>: <span class="columnValue"><!--column value--></span></li>', this.disabled = !0, this.skipNextWindowsWidthChange = !1, this.init(b, c)
}
ResponsiveDatatablesHelper.prototype.init = function(a, b) {
    this.origBreakpointsDefs = a, this.initBreakpoints(), this.disable(!1), $.extend(this.options, b)
}, ResponsiveDatatablesHelper.prototype.initBreakpoints = function() {
    if (this.saveState && this.getState(), !this.lastStateExists) {
        var a = [];
        for (var b in this.origBreakpointsDefs) a.push({
            "name": b,
            "upperLimit": this.origBreakpointsDefs[b],
            "columnsToHide": []
        });
        a.sort(function(a, b) {
            return a.upperLimit - b.upperLimit
        });
        for (var c = 0, d = 0; d < a.length; d++) a[d].lowerLimit = c, c = a[d].upperLimit;
        a.push({
            "name": "always",
            "lowerLimit": c,
            "upperLimit": 1 / 0,
            "columnsToHide": []
        }), this.breakpoints = {};
        var d, e;
        for (d = 0, e = a.length; e > d; d++) this.breakpoints[a[d].name] = a[d];
        var f = this.api.columns().header(),
            g = [];
        for (d = 0, e = f.length; e > d; d++) this.api.columns(d).visible() && (this.columnIndexes.push(d), g.push(f[d]));
        for (var h = 0; h < g.length; h++) {
            var i = $(g[h]);
            "expand" === i.attr("data-class") && (this.expandColumn = this.columnIndexes[h]);
            var j = i.attr("data-hide");
            if (void 0 !== j)
                for (var k = j.split(/,\s*/), d = 0; d < k.length; d++) {
                    var l = k[d];
                    if ("always" === l)
                        for (var b in this.breakpoints) "default" !== this.breakpoints[b].name && this.breakpoints[b].columnsToHide.push(this.columnIndexes[h]);
                    else void 0 !== this.breakpoints[l] && this.breakpoints[l].columnsToHide.push(this.columnIndexes[h])
                }
        }
    }
}, ResponsiveDatatablesHelper.prototype.setWindowsResizeHandler = function(a) {
    if (void 0 === a && (a = !0), a) {
        var b = this;
        $(window).bind("resize", function() {
            b.respond()
        })
    } else $(window).unbind("resize")
}, ResponsiveDatatablesHelper.prototype.respond = function() {
    if (!this.disabled) {
        var a = this,
            b = $(window).width(),
            c = [];
        for (var d in this.breakpoints) {
            var e = this.breakpoints[d];
            (!e.lowerLimit || b > e.lowerLimit) && (!e.upperLimit || b <= e.upperLimit) && (this.currentBreakpoint = e.name, c = e.columnsToHide)
        }
        var f = !1;
        if (!this.skipNextWindowsWidthChange)
            if (0 === this.lastBreakpoint.length && c.length) f = !0;
            else if (this.lastBreakpoint != this.currentBreakpoint) f = !0;
        else if (this.columnsHiddenIndexes.length !== c.length) f = !0;
        else {
            var g = this.difference(this.columnsHiddenIndexes, c).length,
                h = this.difference(c, this.columnsHiddenIndexes).length;
            f = g + h > 0
        }
        f && (this.skipNextWindowsWidthChange = !0, this.columnsHiddenIndexes = c, this.columnsShownIndexes = this.difference(this.columnIndexes, this.columnsHiddenIndexes), this.showHideColumns(), this.lastBreakpoint = this.currentBreakpoint, this.setState(), this.skipNextWindowsWidthChange = !1), this.columnsHiddenIndexes.length ? (this.tableElement.addClass("has-columns-hidden"), $("tr.detail-show", this.tableElement).each(function(b, c) {
            var d = $(c);
            0 === d.next(".row-detail").length && ResponsiveDatatablesHelper.prototype.showRowDetail(a, d)
        })) : (this.tableElement.removeClass("has-columns-hidden"), $("tr.row-detail").each(function() {
            ResponsiveDatatablesHelper.prototype.hideRowDetail(a, $(this).prev())
        }))
    }
}, ResponsiveDatatablesHelper.prototype.showHideColumns = function() {
    for (var a = 0, b = this.columnsShownIndexes.length; b > a; a++) this.api.column(this.columnsShownIndexes[a]).visible(!0);
    for (var a = 0, b = this.columnsHiddenIndexes.length; b > a; a++) this.api.column(this.columnsHiddenIndexes[a]).visible(!1);
    var c = this;
    $("tr.row-detail").each(function() {
        ResponsiveDatatablesHelper.prototype.hideRowDetail(c, $(this).prev())
    }), this.tableElement.hasClass("has-columns-hidden") && $("tr.detail-show", this.tableElement).each(function(a, b) {
        ResponsiveDatatablesHelper.prototype.showRowDetail(c, $(b))
    })
}, ResponsiveDatatablesHelper.prototype.createExpandIcon = function(a) {
    if (!this.disabled)
        for (var b = $("td", a), c = 0, d = b.length; d > c; c++) {
            var e = b[c],
                f = this.api.cell(e).index().column;
            if (e = $(e), f === this.expandColumn) {
                if (0 == $("span.responsiveExpander", e).length) switch (e.prepend(this.expandIconTemplate), this.options.clickOn) {
                    case "cell":
                        e.on("click", {
                            "responsiveDatatablesHelperInstance": this
                        }, this.showRowDetailEventHandler);
                        break;
                    case "row":
                        $(a).on("click", {
                            "responsiveDatatablesHelperInstance": this
                        }, this.showRowDetailEventHandler);
                        break;
                    default:
                        e.on("click", "span.responsiveExpander", {
                            "responsiveDatatablesHelperInstance": this
                        }, this.showRowDetailEventHandler)
                }
                break
            }
        }
}, ResponsiveDatatablesHelper.prototype.showRowDetailEventHandler = function(a) {
    var b = a.data.responsiveDatatablesHelperInstance;
    if (!b.disabled) {
        var c = $(this);
        if (c.closest("table").hasClass("has-columns-hidden")) {
            var d = c.closest("tr");
            d.hasClass("detail-show") ? ResponsiveDatatablesHelper.prototype.hideRowDetail(b, d) : ResponsiveDatatablesHelper.prototype.showRowDetail(b, d), d.toggleClass("detail-show"), a.stopPropagation()
        }
    }
}, ResponsiveDatatablesHelper.prototype.showRowDetail = function(a, b) {
    for (var c = a.api, d = c.columns().header(), e = $(a.rowTemplate), f = $("ul", e), g = 0; g < a.columnsHiddenIndexes.length; g++) {
        var h = a.columnsHiddenIndexes[g],
            i = c.row(b).index(),
            j = c.cell(i, h).node();
        if (!a.options.hideEmptyColumnsInRowDetail || j.innerHTML.trim().length) {
            var k = $(a.rowLiTemplate),
                l = $(d[h]).attr("data-name");
            $(".columnTitle", k).html(void 0 !== l ? l : d[h].innerHTML);
            for (var m = $(j).contents(), n = m.clone(), o = 0, p = m.length; p > o; o++) {
                var q = m[o];
                q.nodeType === Node.ELEMENT_NODE && "SELECT" === q.tagName && (n[o].selectedIndex = q.selectedIndex)
            }
            $(".columnValue", k).append(n).data("originalTdSource", j), k.attr("data-column", h);
            var r = $(j).attr("class");
            "undefined" !== r && r !== !1 && "" !== r && k.addClass(r), f.append(k)
        }
    }
    var s = a.columnIndexes.length - a.columnsHiddenIndexes.length;
    e.find("> td").attr("colspan", s), b.after(e), a.options.showDetail && a.options.showDetail(e)
}, ResponsiveDatatablesHelper.prototype.hideRowDetail = function(a, b) {
    var c = b.next(".row-detail");
    a.options.hideDetail && a.options.hideDetail(c), c.find("li").each(function() {
        var a = $(this).find("span.columnValue"),
            b = a.contents(),
            c = a.data("originalTdSource");
        $(c).empty().append(b)
    }), c.remove()
}, ResponsiveDatatablesHelper.prototype.disable = function(a) {
    this.disabled = void 0 === a || a, this.disabled ? (this.setWindowsResizeHandler(!1), $("tbody tr.row-detail", this.tableElement).remove(), $("tbody tr", this.tableElement).removeClass("detail-show"), $("tbody tr span.responsiveExpander", this.tableElement).remove(), this.columnsHiddenIndexes = [], this.columnsShownIndexes = this.columnIndexes, this.showHideColumns(), this.tableElement.removeClass("has-columns-hidden"), this.tableElement.off("click", "span.responsiveExpander", this.showRowDetailEventHandler)) : this.setWindowsResizeHandler()
}, ResponsiveDatatablesHelper.prototype.getState = function() {
    try {
        var a = JSON.parse(decodeURIComponent(this.getCookie(this.cookieName)));
        a && (this.columnIndexes = a.columnIndexes, this.breakpoints = a.breakpoints, this.expandColumn = a.expandColumn, this.lastBreakpoint = a.lastBreakpoint, this.lastStateExists = !0)
    } catch (b) {}
}, ResponsiveDatatablesHelper.prototype.setState = function() {
    var a = this.difference(this.lastColumnsHiddenIndexes, this.columnsHiddenIndexes).length,
        b = this.difference(this.columnsHiddenIndexes, this.lastColumnsHiddenIndexes).length;
    if (a + b > 0) {
        var c = encodeURIComponent(JSON.stringify({
            "columnIndexes": this.columnIndexes,
            "columnsHiddenIndexes": this.columnsHiddenIndexes,
            "breakpoints": this.breakpoints,
            "expandColumn": this.expandColumn,
            "lastBreakpoint": this.lastBreakpoint
        }));
        this.setCookie(this.cookieName, c, 72e5), this.lastColumnsHiddenIndexes = this.columnsHiddenIndexes.slice(0)
    }
}, ResponsiveDatatablesHelper.prototype.getCookie = function(a) {
    for (var b = a + "=", c = document.cookie.split(";"), d = 0; d < c.length; d++) {
        var e = c[d].trim();
        if (0 == e.indexOf(b)) return e.substring(b.length, e.length)
    }
    return ""
}, ResponsiveDatatablesHelper.prototype.setCookie = function(a, b, c) {
    var d = new Date;
    d.setTime(d.getTime() + c);
    var e = "expires=" + d.toGMTString();
    document.cookie = a + "=" + b + "; " + e
}, ResponsiveDatatablesHelper.prototype.difference = function(a, b) {
    var c, d = [],
        e = {};
    for (c = b.length - 1; c >= 0; c--) e[b[c]] = !0;
    for (c = a.length - 1; c >= 0; c--) e[a[c]] !== !0 && d.push(a[c]);
    return d
};