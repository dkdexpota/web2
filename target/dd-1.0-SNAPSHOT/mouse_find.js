
document.getElementById("svg_check").onclick = function(event){
    let radiusValue = document.getElementById("rad").value;
    let clickX = Number(event.offsetX) - 150;
    let clickY = Number(event.offsetY) - 150;
    let x_val = ((radiusValue * clickX)/120).toFixed(1);
    let y_val = ((-1) * (radiusValue * clickY)/120).toFixed(2);
    if (x_val<=2 && x_val >= -2 && x_val%0.5 == 0 && y_val > -3 && y_val < 3) {
        let a = "?coord_x=" + String(x_val) + "&coord_y=" + String(y_val) + "&radius=" + String(radiusValue);
        document.location.href = "/dd-1.0-SNAPSHOT/treatment" + a;
    } else {
        document.getElementById("print_text").textContent = "X: " + String(x_val) + "   Y: " + String(y_val);
    }
}