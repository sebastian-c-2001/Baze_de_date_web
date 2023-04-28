from flask import Flask, render_template, request, url_for, flash
from flask_mysqldb import MySQL
from werkzeug.utils import redirect
from flask import Blueprint

app =Flask(__name__)
app.secret_key = 'many random bytes'
app.config['MYSQL_HOST']= 'localhost'
app.config['MYSQL_USER']= 'root'
app.config['MYSQL_PASSWORD']= '123456'
app.config['MYSQL_DB']= 'tema_3'

mysql= MySQL(app)




@app.route('/')
def Index():
    cur = mysql.connection.cursor()
    cur.execute("select  c.idasociere, c.idautori idautori_asociere, a.nume Nume_Autor, a.prenume Prenume_Autor,c.idproiecte idproiecte_asociere, b.denumire Denumire_Proiect, b.termen_limita Termen_limita from autori a, proiecte b, asociere c where a.idautori = c.idautori and b.idproiecte = c.idproiecte;")
    data = cur.fetchall()
    cur.close()
    return render_template('asociere_web.html', asociere = data)


@app.route('/insert', methods = ['POST'])
def insert():
    if request.method == "POST":
        flash("Asociere realizata cu succes!")
        idautori = request.form['idautori']
        idproiecte = request.form['idproiecte']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO asociere (idautori,idproiecte) VALUES ( %s, %s)", (idautori,idproiecte))
        mysql.connection.commit()
        return redirect(url_for('Index'))


@app.route('/delete/<string:id_data>', methods = ['GET'])
def delete(id_data):
        flash("Asociere stearsa!")
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM asociere WHERE idasociere=%s", (id_data))
        mysql.connection.commit()
        return redirect(url_for('Index'))


@app.route('/update', methods = ['POST', 'GET'])
def update():
    if request.method == 'POST':
        idasociere = request.form['idasociere']
        idautori = request.form['idautori']
        idproiecte = request.form['idproiecte']
        cur = mysql.connection.cursor()
        cur.execute("""UPDATE asociere SET idautori=%s, idproiecte=%s WHERE idasociere=%s """, (idautori,idproiecte,idasociere))
        mysql.connection.commit()
        flash("Asociere actualizata.")
        return redirect(url_for('Index'))

if __name__ == "__main__":
    app.run(debug=True)