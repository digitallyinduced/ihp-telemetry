module Admin.View.Events.Index where
import Admin.View.Prelude

data IndexView = IndexView { events :: [Event] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <h1>IHP Telemetry</h1>
        <div class="table-responsive table-sm table-hover">
            <table class="table">
                <thead>
                    <tr>
                        <th>Time</th>
                        <th>IHP Version</th>
                        <th>OS</th>
                        <th>Arch</th>
                        <th>Project Id</th>
                    </tr>
                </thead>
                <tbody>{forEach events renderEvent}</tbody>
            </table>
        </div>
    |]


renderEvent event = [hsx|
    <tr>
        <td>{get #createdAt event |> timeAgo}</td>
        <td>{get #ihpVersion event}</td>
        <td>{get #os event}</td>
        <td>{get #arch event}</td>
        <td>{get #projectId event}</td>
    </tr>
|]
