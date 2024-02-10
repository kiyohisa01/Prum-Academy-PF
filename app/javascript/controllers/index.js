// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)



$("[name=month]").change(function () {
    // 選択されているvalue属性値を取り出す
    let val = $("[name=month]").val();
    if (val == "1") {
        $("#A今月").show();
        $("#B先月").hide();
        $("#C先々月").hide();
    } else if (val == "2") {
        $("#A今月").hide();
        $("#B先月").show();
        $("#C先々月").hide();
    } else if (val == "3") {
        $("#A今月").hide();
        $("#B先月").hide();
        $("#C先々月").show();
    }
});