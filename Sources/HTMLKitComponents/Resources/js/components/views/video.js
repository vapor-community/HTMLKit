(function()  {

    'use strict';

    /**
     * Initiates the video object.
     *
     * @constructor
     *
     * @param element
     */
    const Video = function(element) {

        this.element = element;

        this.observeViewEntry();
    };


    /**
     * Observes the view entry and toggles the playback.
     */
    Video.prototype.observeViewEntry = function () {

        const self= this;

        const observer = new IntersectionObserver(function (entries) {

            entries.forEach(function (entry) {

                if (entry.isIntersecting) {
                    self.play();

                } else {
                    self.pause();
                }
            });
        });

        observer.observe(this.element);

    };

    /**
     * Begins or resumes the playback.
     */
    Video.prototype.play = function () {
        this.element.play();
    };

    /**
     * Pauses the playback.
     */
    Video.prototype.pause = function () {
        this.element.pause();
    };
     
    const videos = document.getElementsByClassName('video');
     
    for (const video of videos) {
        new Video(video);
    }

}());
