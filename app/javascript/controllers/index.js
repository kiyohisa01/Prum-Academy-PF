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
    console.log(val);
    if (val == "1") {
        $("#B今月").show();
        $("#B先月").hide();
        $("#B先々月").hide();
        $("#F今月").show();
        $("#F先月").hide();
        $("#F先々月").hide();
        $("#I今月").show();
        $("#I先月").hide();
        $("#I先々月").hide();
    } else if (val == "2") {
        $("#B今月").hide();
        $("#B先月").show();
        $("#B先々月").hide();
        $("#F今月").hide();
        $("#F先月").show();
        $("#F先々月").hide();
        $("#I今月").hide();
        $("#I先月").show();
        $("#I先々月").hide();
    } else if (val == "3") {
        $("#B今月").hide();
        $("#B先月").hide();
        $("#B先々月").show();
        $("#F今月").hide();
        $("#F先月").hide();
        $("#F先々月").show();
        $("#I今月").hide();
        $("#I先月").hide();
        $("#I先々月").show();
    }
});