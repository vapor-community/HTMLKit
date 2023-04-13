 (function() {
     
     var Datepicker = function (element) {
         
         this.element = element
         this.datefield = element.getElementsByClassName('datepicker-datefield')[0];
         this.picker = element.getElementsByClassName('datepicker-picker')[0];
         this.calendar = element.getElementsByClassName('picker-calendar')[0];
         this.detail = element.getElementsByClassName('calendar-detail')[0];
         this.navigation = element.getElementsByClassName('calendar-navigation')[0];
         this.date = new Date().getDate();
         this.month = new Date().getMonth();
         this.year = new Date().getFullYear();
         this.day = new Date().getDay();
         
         this.createCalendar();
         
         this.initiateListener();
     };
     
     /*
      Initiates the listeners.
      */
     Datepicker.prototype.initiateListener = function () {
         
         var self = this;
         
         this.datefield.addEventListener('focus', function (event) {
             self.showPicker();
         });
         
         this.datefield.addEventListener('focusout', function (event) {
             self.hidePicker();
         });
         
         this.navigation.addEventListener('mousedown', function (event) {
             
             event.preventDefault();
             
             if(event.target.tagName = 'BUTTON') {
                 
                 switch(event.target.value) {
                         
                     case 'previous':
                         
                         self.browsePrevious();
                         
                         break;
                         
                     case 'next':
                         
                         self.browseNext();
                         
                         break;
                 }
             }
             
         });
         
         this.calendar.addEventListener('mousedown', function (event) {
             
             event.preventDefault();
             
             if(event.target.tagName == 'LI') {
                 
                 self.setInputValue(event.target.firstChild.dateTime);
                 
                 self.hidePicker();
             }
             
             if(event.target.tagName == 'TIME') {
                 
                 self.setInputValue(event.target.dateTime);
                 
                 self.hidePicker();
             }
         });
     };
     
     /*
      Recreates the calendar by the selection.
      */
     Datepicker.prototype.createCalendar = function () {
         
         var calendar = '';
         
         for(var j = 0; j < getFirstOfMonth(this.year, this.month); j++) {
             calendar = calendar + '<li></li>';
         }
         
         for(var i = 1; i < getLastOfMonth(this.year, this.month) + 1; i++) {
             calendar = calendar + '<li><time datetime="' + this.year + '-' + (this.month + 1) + '-' + i + '">' + i + '</time></li>';
         }
         
         this.setCalendarDetail(this.year, this.month);
         
         this.calendar.innerHTML = calendar;
     };
     
     /*
      Updates the calendar details.
      */
     Datepicker.prototype.setCalendarDetail = function (year, month) {
         
         const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
         
         this.detail.innerHTML = months[month] + ' ' + year;
     };
     
     /*
      Sets the input value.
      */
     Datepicker.prototype.setInputValue = function (value) {
         this.datefield.value = value;
     };
     
     /*
      Shows the picker.
      */
     Datepicker.prototype.showPicker = function () {
         this.picker.classList.add("state:visible")
     };
     
     /*
      Hides the picker.
      */
     Datepicker.prototype.hidePicker = function () {
         this.picker.classList.remove("state:visible")
     };
     
     /*
      Browses onto the previous month.
      */
     Datepicker.prototype.browsePrevious = function() {
         
         if (this.month < 1) {
             
             this.year -= 1;
             this.month = 11;
             
         } else {
             this.month -= 1;
         }
         
         this.createCalendar();
     };
     
     /*
      Browses onto the next month.
      */
     Datepicker.prototype.browseNext = function() {
         
         if (this.month > 10) {
             
             this.year += 1;
             this.month = 0;
             
         } else {
             this.month += 1;
         }
         
         this.createCalendar();
     };
     
     /// Calculates the weekday for the first of the month.
     function getFirstOfMonth(year, month) {
         return new Date(year, month, 1).getDay();
     };
     
     /// Calculates the total days of the month.
     function getLastOfMonth(year, month) {
         return new Date(year, month, 0).getDate();
     };
     
     var datepicker = document.getElementsByClassName('datepicker');
     
     if(datepicker.length > 0) {
         
         for(var i = 0; i < datepicker.length; i++) {
             
             (function(i) {
                 new Datepicker(datepicker[i]);
             })(i);
         }
     }
     
 }());
