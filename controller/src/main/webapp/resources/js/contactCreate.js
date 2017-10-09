function onBodyLoad() {
    var resetButtons = document.getElementsByClassName('btn btn-default fieldReset');
    for (var i = 0; i < resetButtons.length; i++) {
        resetButtons[i].addEventListener("click", resetFieldset);
    }
}

function onResetAllClick() {
    companyRadioChange(true);
}

function resetFieldset(event) {
    event = event || window.event;
    var resetButton = event.target || event.srcElement;
    var fieldset = resetButton.parentElement.parentElement;
    $(fieldset).find(":input").each(function () {
        if (this.value !== this.defaultValue) {
            this.value = this.defaultValue;
        }
    });
}

function companyRadioChange(value) {
    var groups = document.getElementsByClassName('form-group companyNew');
    for (var i = 0; i < groups.length; i++) {
        groups[i].hidden = !value;
    }
    groups = document.getElementsByClassName('form-group companySelect');
    for (i = 0; i < groups.length; i++) {
        groups[i].hidden = value;
    }
}

function taskPeriodChange() {
    var value = Number(document.getElementById('task_period').value);
    var currDate = new Date(), timeId = 0;
    var year = currDate.getFullYear();
    var month = currDate.getMonth();
    var date = currDate.getDate();
    switch (value) {
        case 0:
            timeId = currDate.getHours() * 2 + (currDate.getMinutes() < 30 ? 2 : 3);
            timeId = timeId > 48 ? 1 : timeId;
            break;
        case 1:
            break;
        case 2:
            currDate = new Date(year, month, date + 1);
            break;
        case 3:
            var dayNumber = currDate.getDay();
            if (dayNumber === 0) {
                dayNumber = 7;
            }
            currDate = new Date(year, month, date + 8 - dayNumber);
            break;
        case 4:
            currDate = new Date(year, month + 1);
            break;
        case 5:
            currDate = new Date(year + 1, 0);
            break;
        default:
    }
    document.getElementById('task_date').value = formatDate(currDate);
    document.getElementById('task_time').options[timeId].selected = true;
}

function formatDate(date) {
    var month = date.getMonth() + 1;
    var day = date.getDate();
    return [date.getFullYear(), (month < 10 ? '0' : '') + month, (day < 10 ? '0' : '') + day].join('-');
}
