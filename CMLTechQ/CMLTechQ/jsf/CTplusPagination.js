$.fn.dataTableExt.oPagination.CTplusPagination = {
    "fnInit": function (oSettings, nPaging, fnCallbackDraw) {

        var nFirst = document.createElement('span');
        var nPrevious = document.createElement('span');
        var nNext = document.createElement('span');
        var nLast = document.createElement('span');
        var nInput = document.createElement('input');
        var nPage = document.createElement('span');
        var nOf = document.createElement('span');    
               
        nFirst.innerHTML = '<i class="fa fa-fast-backward"></i> &nbsp;&nbsp;';
        nPrevious.innerHTML = '<i class="fa fa-backward"></i>&nbsp;&nbsp;';
        nNext.innerHTML = '&nbsp;&nbsp;<i class="fa fa-forward"></i>&nbsp;&nbsp;';
        nLast.innerHTML = '<i class="fa fa-fast-forward"></i>';
            
        nFirst.className = "paginate_button first";
        nPrevious.className = "paginate_button previous";
        nNext.className = "paginate_button next";
        nLast.className = "paginate_button last";
        nOf.className = "paginate_of";
        nPage.className = "paginate_page";

        if (oSettings.sTableId !== '') {
            nPaging.setAttribute('id', oSettings.sTableId + '_paginate');
            nPrevious.setAttribute('id', oSettings.sTableId + '_previous');
            nPrevious.setAttribute('id', oSettings.sTableId + '_previous');
            nNext.setAttribute('id', oSettings.sTableId + '_next');
            nLast.setAttribute('id', oSettings.sTableId + '_last');
        }

        nInput.type = "text";
        nInput.style.width = "30px";
        nInput.style.display = "inline";
        nPage.innerHTML = "Page ";
        nInput.style.border = "0";
        nInput.style.textAlign = "center";

        nPaging.appendChild(nFirst);
        nPaging.appendChild(nPrevious);
        nPaging.appendChild(nPage);
        nPaging.appendChild(nInput);
        nPaging.appendChild(nOf);
        nPaging.appendChild(nNext);
        nPaging.appendChild(nLast);

        $(nFirst).click(function () {
            oSettings.oApi._fnPageChange(oSettings, "first");
            fnCallbackDraw(oSettings);         
        });

        $(nPrevious).click(function () {
            oSettings.oApi._fnPageChange(oSettings, "previous");
            fnCallbackDraw(oSettings);
        });

        $(nNext).click(function () {
            oSettings.oApi._fnPageChange(oSettings, "next");
            fnCallbackDraw(oSettings);
        });

        $(nLast).click(function () {
            oSettings.oApi._fnPageChange(oSettings, "last");
            fnCallbackDraw(oSettings);
        });

        $(nInput).keyup(function (e) {

            if (e.which == 38 || e.which == 39) {
                this.value++;
            }
            else if ((e.which == 37 || e.which == 40) && this.value > 1) {
                this.value--;
            }

            if (this.value == "" || this.value.match(/[^0-9]/)) {
                /* Nothing entered or non-numeric character */
                return;
            }

            var iNewStart = oSettings._iDisplayLength * (this.value - 1);
            if (iNewStart > oSettings.fnRecordsDisplay()) {
                /* Display overrun */
                oSettings._iDisplayStart = (Math.ceil((oSettings.fnRecordsDisplay() - 1) /
                    oSettings._iDisplayLength) - 1) * oSettings._iDisplayLength;
                fnCallbackDraw(oSettings);
                return;
            }

            oSettings._iDisplayStart = iNewStart;
            fnCallbackDraw(oSettings);
        });

        /* Take the brutal approach to cancelling text selection */
        $('span', nPaging).bind('mousedown', function () { return false; });
        $('span', nPaging).bind('selectstart', function () { return false; });

        nPrevious.className = "paginate_disabled_previous";
        //nNext.className = "paginate_disabled_next";
    },


    "fnUpdate": function (oSettings, fnCallbackDraw) {
        if (!oSettings.aanFeatures.p) {
            return;
        }
        var iPages = Math.ceil((oSettings.fnRecordsDisplay()) / oSettings._iDisplayLength);
        var iCurrentPage = Math.ceil(oSettings._iDisplayStart / oSettings._iDisplayLength) + 1;

        /* Loop over each instance of the pager */
        var an = oSettings.aanFeatures.p;
        for (var i = 0, iLen = an.length ; i < iLen ; i++) {
            var spans = an[i].getElementsByTagName('span');
            var inputs = an[i].getElementsByTagName('input');
            spans[3].innerHTML = " of " + iPages
            inputs[0].value = iCurrentPage;
           

            if (an[i].childNodes.length !== 0) {
                an[i].childNodes[0].className =
					(oSettings._iDisplayStart === 0) ?
					oSettings.oClasses.sPagePrevDisabled : oSettings.oClasses.sPagePrevEnabled;
               
                an[i].childNodes[1].className =
					(oSettings.fnDisplayEnd() == oSettings.fnRecordsDisplay()) ?
					oSettings.oClasses.sPageNextDisabled : oSettings.oClasses.sPageNextEnabled;

             if (oSettings._iDisplayStart === 0 && oSettings.fnDisplayEnd() == oSettings.fnRecordsDisplay()) {
                    spans[4].style.color = "#CCCCCC";
                    spans[5].style.color = "#CCCCCC";

                    spans[0].style.color = "#CCCCCC";
                    spans[1].style.color = "#CCCCCC";
                }
               
                else if (oSettings._iDisplayStart === 0)
                {
                    spans[0].style.color = "#CCCCCC";
                    spans[1].style.color = "#CCCCCC";
                    
                    spans[4].style.color = "#666666";
                    spans[5].style.color = "#666666";
                }
                else  if (oSettings.fnDisplayEnd() == oSettings.fnRecordsDisplay())
                {
                    spans[4].style.color = "#CCCCCC";
                    spans[5].style.color = "#CCCCCC";

                    spans[0].style.color = "#666666";
                    spans[1].style.color = "#666666";
                }

                else {
                    spans[4].style.color = "#666666";
                    spans[5].style.color = "#666666";

                    spans[0].style.color = "#666666";
                    spans[1].style.color = "#666666";
                }
            }
        }
    }
};