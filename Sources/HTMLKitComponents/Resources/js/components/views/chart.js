(function() {

    'use strict';

    /**
     * Initiates the chart object.
     */
    const Chart = function (element) {

        this.element = element;
        this.padding = 100;
        this.width = this.element.clientWidth;
        this.height = this.element.clientHeight;
        this.plotWidth = this.element.clientWidth - this.padding;
        this.plotHeight = this.element.clientHeight - this.padding;
        this.marks = element.getElementsByClassName('mark');

        this.initiateListener();
    };

    /**
     * Initiates the event listener.
     */
    Chart.prototype.initiateListener = function () {

        this.setViewBox();

        switch (this.determineType()) {
            case 'Bar':

                this.maximumValue = this.evaluateMaximumValue('Bar');
                this.heightRatio = this.evaluateHeightRatio();
                this.widthRatio = this.evaluateWidthRatio();

                this.element.prepend(this.setXAxis());
                this.element.prepend(this.setYAxis());
                this.element.prepend(this.setGuides());

                this.setMarks();

                break;

            case 'Pie':

                this.maximumValue = this.evaluateMaximumValue('Pie');

                this.setSectors();

                break;
        }
    };

    /**
     * Sets the view box for the chart.
     */
    Chart.prototype.setViewBox = function () {

        this.element.setAttribute('width', this.width.toString());
        this.element.setAttribute('height', this.height.toString());
        this.element.setAttribute('viewbox', `0 0 ${this.width} ${this.height}`);
    };

    /**
     * Creates the vertical axis.
     */
    Chart.prototype.setYAxis = function () {

        let grid= document.createElementNS('http://www.w3.org/2000/svg', 'g');
        grid.setAttribute('class', 'chart-axis');

        let yLine= document.createElementNS('http://www.w3.org/2000/svg', 'line');
        yLine.setAttribute('x1', this.padding.toString());
        yLine.setAttribute('x2', this.padding.toString());
        yLine.setAttribute('y1', this.padding.toString());
        yLine.setAttribute('y2', this.plotHeight.toString());

        grid.appendChild(yLine);

        return grid;
    };

    /**
     * Creates the horizontal axis.
     */
    Chart.prototype.setXAxis = function () {

        let grid= document.createElementNS('http://www.w3.org/2000/svg', 'g');
        grid.setAttribute('class', 'chart-axis');

        let xLine= document.createElementNS('http://www.w3.org/2000/svg', 'line');
        xLine.setAttribute('x1', this.padding.toString());
        xLine.setAttribute('x2', this.plotWidth.toString());
        xLine.setAttribute('y1', this.plotHeight.toString());
        xLine.setAttribute('y2', this.plotHeight.toString());

        grid.appendChild(xLine);

        return grid;
    };

    /**
     * Creates the guides
     */
    Chart.prototype.setGuides = function () {

        // The space between the guides
        let offset = 40;

        // The amount of guides
        let lines = this.maximumValue / offset;

        let guides = document.createElementNS('http://www.w3.org/2000/svg', 'g');
        guides.setAttribute('class', 'chart-guide');

        for (let i = 0; i < (lines + 1); i++) {

            let guide = document.createElementNS('http://www.w3.org/2000/svg', 'line');
            guide.setAttribute('x1', this.padding.toString());
            guide.setAttribute('x2', this.plotWidth.toString());
            guide.setAttribute('y1', (((offset * i) * this.heightRatio) + this.padding).toString());
            guide.setAttribute('y2', (((offset * i) * this.heightRatio) + this.padding).toString());

            let text = document.createElementNS('http://www.w3.org/2000/svg', 'text');
            text.setAttribute('x', (this.padding / 2).toString());
            text.setAttribute('y', (((offset * i) * this.heightRatio) + this.padding).toString());
            text.setAttribute('class', 'chart-label');
            text.innerHTML = (this.maximumValue - (offset * i)).toString();

            guides.appendChild(guide);
            guides.appendChild(text);
        }

        return guides;
    };

    /**
     * Determines the chart type.
     */
    Chart.prototype.determineType = function () {

        if (this.marks[0].classList.contains('type:bar')) {
            return 'Bar'
        }

        if (this.marks[0].classList.contains('type:pie')) {
            return 'Pie'
        }
    };

    /**
     * Evaluates the maximum value.
     */
    Chart.prototype.evaluateMaximumValue = function (type) {

        let maximumValue = 0;

        switch (type) {
            case 'Bar':

                for (const mark of this.marks) {

                    const value = Number(mark.firstChild.textContent);

                    if (value > maximumValue) {
                        maximumValue = value
                    }
                }

                break;

            case 'Pie':

                for (const mark of this.marks) {
                    maximumValue = maximumValue + Number(mark.firstChild.textContent);
                }

                break;
        }

        return maximumValue;
    };

    /**
     * Evaluates the width ratio.
     *
     * The width ratio determinants the width of the bars in the plot area.
     */
    Chart.prototype.evaluateWidthRatio = function () {

        return (this.element.clientWidth - (this.padding * 2)) / this.marks.length;
    };

    /**
     * Evaluates the height ratio.
     *
     * The height ratio determinants the height of the bars in the plot area.
     */
    Chart.prototype.evaluateHeightRatio = function () {

        return (this.element.clientHeight - (this.padding * 2)) / this.maximumValue;
    };

    /**
     * Sets the marks.
     */
    Chart.prototype.setMarks = function () {

        for (let i = 0; i < this.marks.length; i++) {

            let barRectangle = this.marks[i].children[0];

            let computedWidth = 1 * this.widthRatio;
            let computedHeight = Number(barRectangle.textContent) * this.heightRatio;

            let position = (computedWidth * i) + this.padding;

            barRectangle.setAttribute('x', position.toString());
            barRectangle.setAttribute('y', (this.plotHeight - computedHeight).toString());
            barRectangle.setAttribute('width', computedWidth.toString());
            barRectangle.setAttribute('height', computedHeight.toString());

            let text= this.marks[i].children[1];
            text.setAttribute('x', (position + (computedWidth / 2)).toString());
            text.setAttribute('y', (this.element.clientHeight - (this.padding / 2)).toString());
            text.setAttribute('width', computedWidth.toString());
        }
    };

    /**
     * Sets the sectors.
     */
    Chart.prototype.setSectors = function () {

        let dashoffset = 0;

        for (let i = 0; i < this.marks.length; i++) {

            let pieCircle = this.marks[i].children[0];

            let radius = pieCircle.getAttribute('r');
            let ratio = (radius / this.maximumValue) * Number(pieCircle.textContent);
            let circumference = 2 * (22 / 7) * radius;
            let dasharray = (circumference * ratio / radius);

            pieCircle.setAttribute('cx', '50%');
            pieCircle.setAttribute('cy', '50%');
            pieCircle.setAttribute('stroke-dasharray', `${dasharray} ${circumference}`);

            if (i > 0 ) {
                pieCircle.setAttribute('stroke-dashoffset', `-${dashoffset}`);
            }

            dashoffset = dashoffset + dasharray;
        }
    };

    const charts = document.getElementsByClassName('chart');

    for (const chart of charts) {
        new Chart(chart);
    }

}());
