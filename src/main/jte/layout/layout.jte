@param String title
@param gg.jte.Content content
@param gg.jte.Content banner

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <title>@title</title>
    <link rel="stylesheet" href="/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body id="top">
<div id="wrapper">
    <header>
        <h1 id="logo">
            <a href="/">
                <img src="/images/ffc_logo_trans_150.png" alt="Freiwillige Feuerwehr Cronenberg" width="150" height="149">
            </a>
        </h1>

        <!-- Hauptnavigation -->
        <nav id="nav-main">
            <ul>
                <li><a href="/einsatzabteilung">Einsatzabteilung</a></li>
                <li><a href="/technik">Fahrzeuge & Technik</a></li>
                <li><a href="/jugendfeuerwehr">Jugendfeuerwehr</a></li>
                <li><a href="/presse">Presse</a></li>
            </ul>
            <ul>
                <li><a href="/chronik">Chronik</a></li>
                <li><a href="/foerderverein">Förderverein</a></li>
                <li><a href="/ehrenabteilung">Ehrenabteilung</a></li>
                <li><a href="/infos-fuer-buerger">Infos für Bürger</a></li>
            </ul>
        </nav>

        <!-- Mobile Navigation -->
        <nav id="nav-main-mobile">
            <select onchange="location.href=this.value">
                <option value="/">Startseite</option>
                <option value="/einsatzabteilung">Einsatzabteilung</option>
                <option value="/technik">Fahrzeuge & Technik</option>
                <option value="/jugendfeuerwehr">Jugendfeuerwehr</option>
                <option value="/presse">Presse</option>
                <option value="/chronik">Chronik</option>
                <option value="/foerderverein">Förderverein</option>
                <option value="/ehrenabteilung">Ehrenabteilung</option>
                <option value="/infos-fuer-buerger">Infos für Bürger</option>
            </select>
        </nav>
    </header>

    @if(banner != null) {
    <div class="banner">@banner</div>
    }
    @endif

    <main id="content">
        ${content}
    </main>

    <footer>
        <h2>Kontakt aufnehmen</h2>
        <section>
            <h3>Adresse</h3>
            <p>
                Löschzug Cronenberg<br>
                Kemmannstraße 45<br>
                42349 Wuppertal
            </p>
            <ul>
                <li>Tel: 0202 / 563 - 1671</li>
                <li>E-Mail: mail.cronenberg(at)ff-wuppertal.de</li>
            </ul>
        </section>

        <nav id="nav-footer">
            <ul>
                <li><a href="/">Startseite</a></li>
                <li><a href="/search">Suche</a></li>
                <li><a href="/sitemap">Sitemap</a></li>
                <li><a href="/impressum">Impressum</a></li>
                <li><a href="/datenschutz">Datenschutz</a></li>
            </ul>
        </nav>

        <form action="/search" method="get" id="footer-search">
            <label for="footer-search-field">Suchen</label>
            <input type="search" name="keywords" id="footer-search-field">
            <button type="submit">Suchen</button>
        </form>

        <p class="page-top"><a href="#top">Nach oben</a></p>
    </footer>
</div>
</body>
</html>
