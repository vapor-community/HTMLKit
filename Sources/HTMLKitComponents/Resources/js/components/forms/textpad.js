 (function() {
     
     'use strict';
     
     /**
      * Initiates the textpad object.
      */
     const Textpad = function (element) {
         
         this.element = element;
         this.history = [];
         this.context = element.getElementsByClassName('toolbar-context')[0];
         this.content = element.getElementsByClassName('textpad-content')[0];
         this.action = element.getElementsByClassName('textpad-action')[0];
         this.revision = element.getElementsByClassName('textpad-revision')[0];

         this.initiateListener();

         this.index = this.writeHistory(this.content.value);
     };
     
     /**
      * Initiates the event listener.
      */
     Textpad.prototype.initiateListener = function () {
         
         const self = this;

         const undo = this.revision.getElementsByClassName('toolbar-tool')[0];

         // Listens to text changes
         this.content.addEventListener('input', function (event) {

             self.index = self.writeHistory(self.content.value);

             if (self.index >= 1) {
                 undo.classList.remove('state:disabled');
             }

         });

         this.revision.addEventListener('click', function(event) {

             if (event.target.tagName === 'BUTTON') {

                 const command = event.target.dataset.command;

                 self.content.setRangeText(self.revertChange(command), 0, self.content.textLength, 'end');

                 self.checkRevision();
             }
         });

         // Listens to tool selection
         this.action.addEventListener('click', function (event) {

             if (event.target.tagName === 'BUTTON') {

                 const command = event.target.dataset.command;

                 self.content.setRangeText(self.replaceSelection(command), self.content.selectionStart, self.content.selectionEnd);

                 // Write history, since the listener does not act on text replacements
                 self.index = self.writeHistory(self.content.value);

                 self.checkRevision();
             }
         });

         // Listens to tool selection
         this.context.addEventListener('click', function (event) {

             if (event.target.tagName === 'BUTTON') {

                 const command = event.target.dataset.command;

                 self.content.setRangeText(self.replaceSelection(command), self.content.selectionStart, self.content.selectionEnd);

                 // Write history, since the listener does not act on text replacements
                 self.index = self.writeHistory(self.content.value);

                 self.checkRevision();
             }
         });

         // Dismisses the context menu, when the escape key as pushed
         window.addEventListener('keyup', function (event) {

             if(event.key === 'Escape') {
                 self.context.removeAttribute('open');
             }
         });

         // Dismisses the context menu, when it loses its focus
         window.addEventListener('click', function (event) {

             if (!self.context.contains(event.target)) {
                 self.context.removeAttribute('open');
             }
         });
     };

     /**
      * Checks the revision state.
      */
     Textpad.prototype.checkRevision = function () {

         const undo = this.revision.getElementsByClassName('toolbar-tool')[0];
         const redo = this.revision.getElementsByClassName('toolbar-tool')[1];

         if (this.index >= 1) {
             undo.classList.remove('state:disabled');

         } else {
             undo.classList.add('state:disabled');
         }

         if (this.index < (this.history.length - 1)) {
             redo.classList.remove('state:disabled');

         } else {
             redo.classList.add('state:disabled');
         }
     };

     /**
      * Reverts the latest text change.
      */
     Textpad.prototype.revertChange = function (command){

         switch (command) {
             case 'undo':

                 if (this.index > 0) {

                     this.index = this.index - 1;

                     return this.history[this.index]
                 }

                 return this.content.value;

             case 'redo':

                 if (this.index < (this.history.length-1)) {

                     this.index = this.index + 1;

                     return this.history[this.index]
                 }

                 return this.content.value;
         }
     };
     
     /**
      * Gets the text value of the current selection.
      */
     Textpad.prototype.getSelection = function () {
         return this.content.value.substring(this.content.selectionStart, this.content.selectionEnd);
     };

     /**
      * Replaces the selection with the specific Markdown markup.
      */
     Textpad.prototype.replaceSelection = function (command) {

         const selection = this.getSelection();

         switch (command) {
             case 'bold':
                 return '**insert**'.replace('insert', selection);

             case 'italic':
                 return '_insert_'.replace('insert', selection);

             case 'strikethrough':
                 return '~~insert~~'.replace('insert', selection);

             case 'code':
                 return '`insert`'.replace('insert', selection);

             case 'link':
                 return '[insert](url)'.replace('insert', selection);
         }
     };

     /**
      * Writes into the history and returns the new index.
      */
     Textpad.prototype.writeHistory = function (value) {

         this.history.push(value);

         return this.history.length - 1;
     };

     const textpads = document.getElementsByClassName('textpad');
     
     for (const textpad of textpads) {
         new Textpad(textpad);
     }
     
 }());
