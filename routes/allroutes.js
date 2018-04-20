
var db = require('../config/db_config').connect();

module.exports = function (app) { // module.exports opslutter her routesne

    // Viser alle arrangementer på forsiden / Index page
    app.get('/', function (req, res) {
        db.query("SELECT arrangementer.* , sale.navn AS 'sal', type.navn AS 'type' FROM(( arrangementer INNER JOIN sale ON Sal_fk = sale.id) INNER JOIN type ON type_fk = type.id)", (error, rows) => {
            db.query('SELECT* FROM type', function (err, data_typer) {
                res.render('pages/index', {
                    side: "index",
                    arrangement: rows,
                    typer: data_typer
                });
            })
        });
    });

    // ================================================================

    // Viser arrangementer i en bestemt kategori på forsiden / Index page
    app.get('/arrangementer/:id', function (req, res) {
        let type_id = req.params['id'];
        console.log(req.params['id']);
        let sql = `SELECT arrangementer.* , 
        sale.navn AS 'sal',
        type.navn AS 'type' 
        FROM(( arrangementer INNER JOIN sale ON Sal_fk = sale.id) 
        INNER JOIN type ON type_fk = type.id) 
        WHERE type.id =  ${req.params['id']}`;
        if (type_id == 0) {
            db.query("SELECT arrangementer.* , sale.navn AS 'sal', type.navn AS 'type' FROM(( arrangementer INNER JOIN sale ON Sal_fk = sale.id) INNER JOIN type ON type_fk = type.id)", (error, rows) => {
                res.json(rows);
            });
        } else {
            db.query(sql, (error, rows) => {
                res.json(rows);

            });
        }
    });

    // ================================================================

    // Hent et arrangement
    app.get('/arrangement/:id', function (req, res) {
        db.query(`SELECT * FROM arrangementer WHERE id = ${req.params.id}`, (error, rows) => {
            res.json(rows);
        });
    });

    // ================================================================

    // Om os page
    app.get('/omos', function (req, res) {
        res.render('pages/omos', {
            side: "omos"
        });
    });

    // ================================================================

    // Kontakt page
    app.get('/kontakt', function (req, res) {
        res.render('pages/kontakt', {
            side: "kontakt"
        });
    });

    // ================================================================

    // Lej lokaler page
    app.get('/lokaler', function (req, res) {
        res.render('pages/lokaler', {
            side: "lokaler"
        });
    });

    // ================================================================


    // Booking page
    app.get('/booking', function (req, res) {
        res.render('pages/booking', {
            side: "booking"
        });
    });

    // ================================================================

    // Rediger arrangementer / Ret page
    app.get('/ret/:id', function (req, res) {
        db.query(`SELECT arrangementer.* ,
         sale.navn AS 'sal', 
         type.navn AS 'type',
         arrangementer.id as a_id
         FROM(( arrangementer INNER JOIN sale ON Sal_fk = sale.id) 
         INNER JOIN type ON type_fk = type.id) WHERE arrangementer.id = ${req.params.id}`, (error, rows) => {
                //console.log(rows)
                res.render('pages/ret', {
                    side: "ret",
                    rediger: rows
                })
            });
    });

    // ================================================================


    // Rediger arrangementer / Ret page
    app.post('/ret/:id', function (req, res) {
        console.log(req.body)
        db.query(`UPDATE arrangementer
         SET
         navn = ?, 
         pris = ?, 
         Sal_fk = ?,
         varighed = ?,
         beskrivelse = ?
         WHERE id = ${req.params.id}`, [req.body.navn, req.body.pris, req.body.sal, req.body.varighed, req.body.beskrivelse], (error, rows) => {
                if (error) {
                    console.log(error)
                }
                res.redirect("/admin/arrangementer")
            });
    });



}



