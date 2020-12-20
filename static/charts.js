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
                valueRange: [0, 100],
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
};

$(initCharts);
$(document).on('ready turbolinks:load', initCharts);
