module Web.View.Static.About where
import Web.View.Prelude

data AboutView = AboutView

instance View AboutView where
    html AboutView = [hsx|
        <h1>IHP Telemetry</h1>

        <p>
            This telemetry service tracks the following informations:
        </p>

        <ul>
            <li>IHP Version</li>
            <li>OS</li>
            <li>Arch</li>
            <li>Anonymous Project ID, <code>sha512($PROJECT_DIRECTORY_PATH)</code></li>
        </ul>

        <p>
            (c) 2020, digitally induced GmbH
        </p>
    |]
