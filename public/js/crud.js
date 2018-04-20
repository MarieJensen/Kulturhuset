

// Viser arrangementer i en bestemt kategori på admin siden

function hentData() {

    fetch('http://localhost:3000/arrangementer/' + document.querySelector('#selecttypee').value)
        .then((response) => {
            console.log(response)
            return response.json();
        })
        .then((data) => {

            console.log(data);
            var type = '';
            document.getElementById('content2').innerHTML = "";
            data.forEach(function (item) {
                document.getElementById('content2').innerHTML += `
            <div style="float: left" class="lige_kolonner col-md-4 col-xs-12">
                <h4 class="h">
                    <b>
                    ${item.sal}
                    </b>
                </h4>

                <p class="p">
                    <b>
                    ${item.type}
                    :</b>
                    ${item.navn}            
                </p>

                <p class="p">
                    <b>Pris:</b>
                    ${item.pris},- DKK
                </p>

                <p class="p">
                    <b>Dato:</b>
                    ${item.dato}
                </p>

                <p class="p">
                    <b>Varighed:</b>
                    ${item.varighed} min.
                </p>

                <p class="p">
                    <b>Info:</b>
                    ${item.beskrivelse}
                </p>

                <img class="rykned3" src="/images/${item.billede}">

                <a class="opdaterknap" href="/ret/${item.id}">Opdater</a>
                <a class="sletknap" onclick="slet('${item.id}');">Slet</a>
                <br>
                <br>
                <br>
            </div>`;
            })
        })

}

//________________________________________________________________________________________________________________________

// Knap på admin siden som gør at man kommer tilbage på admin siden efter at have klikket på den

function formRedirect() {
    window.location = ("/admin")
    return false
}

//________________________________________________________________________________________________________________________

// For lige høje kolonner

var equalColumns = function () {
    var columns = document.getElementsByClassName('lige_kolonner');

    var length = columns.length;
    var height = 0;

    for (var i = 0; i < length; i++) {
        columns[i].style.height = "auto";
    }

    for (var i = 0; i < length; i++) {
        if (columns[i].clientHeight > height) {
            height = columns[i].clientHeight;
        }
    }
    for (var i = 0; i < length; i++) {
        columns[i].style.height = height + "px";
    }
}
equalColumns();
window.addEventListener("resize", equalColumns, true);

//________________________________________________________________________________________________________________________

// Sletter arrangementer på admin siden

function slet(id) {
    if (confirm('Er du sikker på at du vil slette?')) {
        fetch('http://localhost:3000/slet/' + id)
            .then((response) => {
                console.log(response)
                window.location = ('/admin/arrangementer')
            })
    }
}

//________________________________________________________________________________________________________________________

