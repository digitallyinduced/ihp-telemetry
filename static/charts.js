function initCharts() {
    $('#daily-active-projects').each(function () {
        var dates = $(this).data('dates');
        var values = $(this).data('values');

        var graphArray = [];
        for (var i = 0; i < dates.length; i++) {
            graphArray.push([new Date(dates[i]), values[i]])
        }

        var chart = new Dygraph(this, graphArray, {
                labels: [ "Time", 'Daily Active Users' ],
                valueRange: [0, 100],
                drawGrid: true,
            },
        );
    });


    $('#weekly-active-projects, #monthly-active-projects').each(function () {
        var dates = $(this).data('dates');
        var values = $(this).data('values');

        var graphArray = [];
        for (var i = 0; i < dates.length; i++) {
            graphArray.push([new Date(dates[i]), values[i]])
        }

        var chart = new Dygraph(this, graphArray, {
                labels: [ "Time", 'Daily Active Users' ],
                drawGrid: true,
            },
        );
    });


    $('#total-projects-over-time').each(function () {
        var dates = $(this).data('dates');
        var values = $(this).data('values');

        var graphArray = [];
        for (var i = 0; i < dates.length; i++) {
            graphArray.push([new Date(dates[i]), values[i]])
        }

        smoothPlotter.smoothing = 0.5;

        var chart = new Dygraph(this, graphArray, {
                labels: [ "Time", 'Projects Count' ],
                drawGrid: true,
                rollPeriod: 1,
                series: { "Projects Count": { plotter: smoothPlotter } },
                valueRange: [0, 500]
            },
        );
    });

    $('#total-events-over-time').each(function () {
        var dates = $(this).data('dates');
        var values = $(this).data('values');

        var graphArray = [];
        for (var i = 0; i < dates.length; i++) {
            graphArray.push([new Date(dates[i]), values[i]])
        }

        var chart = new Dygraph(this, graphArray, {
                labels: [ "Time", 'Events Count' ],
                drawGrid: true,
            },
        );
    });

    $('#weekly-active-projects-per-os').each(function () {
        var dates = $(this).data('dates');
        var macosValues = $(this).data('macos-values');
        var linuxValues = $(this).data('linux-values');
        var windowsValues = $(this).data('windows-values');

        function toYYYYMMDD(date) { return new Date(date).toISOString().split('T')[0]; }
        var values = dates.map((date, i) => [new Date(date), macosValues[toYYYYMMDD(date)] || 0, linuxValues[toYYYYMMDD(date)] || 0, windowsValues[toYYYYMMDD(date)] || 0]);

        var chart = new Dygraph(this, values, {
                labels: [ "Time", 'MacOS', "Linux", "Windows" ],
                drawGrid: true,
            },
        );
    });

};

$(initCharts);
$(document).on('ready turbolinks:load', initCharts);
