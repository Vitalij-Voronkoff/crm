function contactWhenChange() {
    document.getElementById("groupContactCalendar").hidden =
        document.getElementById("contactWhen").selectedIndex !== 6;
}

function contactWhenModeClick(mode) {
    if (mode) {
        document.getElementById("contactWhenChangeBtn").setAttribute("class", "btn btn-primary active");
        document.getElementById("contactWhenCreateBtn").setAttribute("class", "btn btn-default");
    } else {
        document.getElementById("contactWhenCreateBtn").setAttribute("class", "btn btn-primary active");
        document.getElementById("contactWhenChangeBtn").setAttribute("class", "btn btn-default");
    }
}

function onBodyLoad() {
    var tabName = document.location.hash.substr(1);
    var ALL = "allentity";
    var CONTACTS = "contacts";
    var COMPANIES = "companies";
    var CLASS = "class";
    if (tabName === ALL || tabName === CONTACTS || tabName === COMPANIES) {
        document.getElementById(ALL + "Tab").setAttribute(CLASS, tabName === ALL ? "active" : "");
        document.getElementById(CONTACTS + "Tab").setAttribute(CLASS, tabName === CONTACTS ? "active" : "");
        document.getElementById(COMPANIES + "Tab").setAttribute(CLASS, tabName === COMPANIES ? "active" : "");
        document.getElementById(ALL).setAttribute(CLASS, "tab-pane" + (tabName === ALL ? " in active" : ""));
        document.getElementById(CONTACTS).setAttribute(CLASS, "tab-pane" + (tabName === CONTACTS ? " in active" : ""));
        document.getElementById(COMPANIES).setAttribute(CLASS, "tab-pane" + (tabName === COMPANIES ? " in active" : ""));
    }
}
