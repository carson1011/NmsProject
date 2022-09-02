//datepicker
$(function() {
	//single
	$('.datepicker').daterangepicker({
		singleDatePicker: true
	});

	//double
	$('.datepicker-range').daterangepicker({
		applyButtonClasses: "btn-info",
	});

	//add time
	$('.datepicker-range-time').daterangepicker({
		applyButtonClasses: "btn-info",
		timePicker: true,
		startDate: moment().startOf('hour'),
		endDate: moment().startOf('hour').add(32, 'hour'),
		locale: {
			format: 'MM/DD/YYYY hh:mm A'
		}
	});

	// datepicker-range-predefined
	var start = moment().subtract(29, 'days');
	var end = moment();

	function cb(start, end) {
		$('.datepicker-range-predefined span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
	}

	$('.datepicker-range-predefined').daterangepicker({
		applyButtonClasses: "btn-info",
		startDate: start,
		endDate: end,
		ranges: {
		'Today': [moment(), moment()],
		'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
		'Last 7 Days': [moment().subtract(6, 'days'), moment()],
		'Last 30 Days': [moment().subtract(29, 'days'), moment()],
		'This Month': [moment().startOf('month'), moment().endOf('month')],
		'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
		}
	}, cb);

	cb(start, end);
});
