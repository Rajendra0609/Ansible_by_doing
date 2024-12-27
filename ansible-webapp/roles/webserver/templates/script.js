document.getElementById('colorPicker').addEventListener('input', function() {
    const selectedColor = this.value;
    document.querySelector('header').style.backgroundColor = selectedColor;
});
