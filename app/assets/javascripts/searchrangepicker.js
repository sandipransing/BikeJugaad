$(document).ready(function() {
  $('#searchrange').daterangepicker(
     {
        ranges: {
           'Last 30 Days': [moment().subtract('days', 29), new Date()],
           'Last 90 Days': [moment().subtract('days', 89), new Date()],
           'Last 180 Days': [moment().subtract('days', 119), new Date()],
        },
        opens: 'left',
        format: 'MM/DD/YYYY',
        separator: ' to ',
        startDate: moment().subtract('days', 29),
        endDate: new Date(),
        minDate: '01/01/2009',
        maxDate: '12/31/2014',
        locale: {
            applyLabel: 'Submit',
            fromLabel: 'From',
            toLabel: 'To',
            customRangeLabel: 'Custom Range',
            daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr','Sa'],
            monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            firstDay: 1
        },
        showWeekNumbers: false,
        buttonClasses: ['btn-danger'],
        dateLimit: false
     },
     function(start, end) {
        $('#searchrange span').html(start.format('MMMM DD, YYYY') + ' - ' + end.format('MMMM DD, YYYY'));
        $('#from_date').val(start.format('MM/D/YYYY'));
        $('#to_date').val(end.format('MM/D/YYYY'));
     }
  );
  //Set the initial state of the picker label
  //$('#searchrange span').html(moment().subtract('days', 29).format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
  //$('#from_date').val(moment().subtract('days', 29).format('MM/D/YYYY'));
  //$('#to_date').val(moment().format('MM/D/YYYY'));

});
