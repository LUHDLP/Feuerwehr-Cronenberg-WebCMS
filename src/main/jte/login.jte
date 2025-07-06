@template.layout.layout(
title = "Login",
banner = null,
content = @`
    <section class="Impressum">
        <h1 class="heading">Login</h1>
        <form method="post" action="/login" class="form-style">
            <input type="text" name="username" placeholder="Benutzername" required />
            <input type="password" name="password" placeholder="Passwort" required />
            <button type="submit" class="btn">Login</button>
        </form>
    </section>
`
)
