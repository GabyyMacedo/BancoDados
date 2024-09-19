from flask import Flask, render_template, request, redirect, url_for, session
import mysql.connector

app = Flask(__name__)
app.secret_key = "supersecretkey"  # Chave secreta para sessões

# Função para conectar ao banco de dados MySQL
def get_db_connection():
    connection = mysql.connector.connect(
        host='localhost',
        user='estudante1',
        password='estudante',
        database='flask_app'
    )
    return connection

# Rota para a página de login
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        # Consulta SQL vulnerável a SQL Injection
        query = f"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'"

        connection = get_db_connection()
        cursor = connection.cursor()
        cursor.execute(query)
        user = cursor.fetchone()

        if user:
            session['username'] = user[1]
            if user[3]:  # Verifica se o usuário é admin
                return redirect(url_for('admin_dashboard'))
            else:
                return "Bem-vindo, usuário!"
        else:
            return "Credenciais inválidas ou conta inexistente."

    return render_template('login.html')

# Rota para o painel de administrador
@app.route('/admin')
def admin_dashboard():
    if 'username' in session:
        return f"Bem-vindo ao painel de admin, {session['username']}!"
    else:
        return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)
