(function()  {

    'use strict';

    /**
     * Initiates the tab object.
     */
    const Tab = function(element) {
        
        this.element = element;
        this.labels = element.getElementsByClassName('tabs-labels')[0];
        this.panes = element.getElementsByClassName('tabs-panes')[0];

        this.selectPane(0);

        this.initiateListener();
    };

    /**
     * Initiates the event listener.
     */
    Tab.prototype.initiateListener = function() {
        
        const self = this;

        this.labels.addEventListener('click', function(event) {

            event.preventDefault();

            if (event.target.tagName === 'A') {

                let name = event.target.getAttribute('href').replace('#', '');

                self.selectPane(self.getIndex(name));
            }
        });
    };

    /**
     * Retrieves the index of the selection.
     */
    Tab.prototype.getIndex = function(name) {

        for (let index= 0; index < this.panes.children.length; index++) {

            if (this.panes.children[index].id === name) {
                return index;
            }
        }
    };

    /**
     * Displays the selected tab pane.
     */
    Tab.prototype.selectPane = function(index) {

        for (const child of this.panes.children) {
            child.classList.remove('state:attached');
        }

        this.panes.children[index].classList.add('state:attached');
    };
    
    const tabs = document.getElementsByClassName('tabs');
    
    for (const tab of tabs) {
        new Tab(tab);
    }
    
}());
