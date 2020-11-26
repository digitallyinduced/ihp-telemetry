module Admin.View.Events.Index where
import Admin.View.Prelude

data IndexView = IndexView
    { events :: [Event]
    , dailyActiveProjects :: [(UTCTime, Int)]
    }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <h1>IHP Telemetry</h1>
        {renderDailyActiveProjects dailyActiveProjects}
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

renderDailyActiveProjects dailyActiveProjects = [hsx|
    <table class="table">
        <thead>
            <tr>
                <th>Date</th>
                <th>Active Projects</th>
            </tr>
        </thead>
        <tbody>{forEach dailyActiveProjects renderRow}</tbody>
    </table>
|]
    where
        renderRow (theDate, count) = [hsx|<tr>
                <td>{date theDate}</td>
                <td>{count}</td>
            </tr>|]


renderEvent event = [hsx|
    <tr>
        <td>{get #createdAt event |> timeAgo}</td>
        <td>{get #ihpVersion event}</td>
        <td>{get #os event}</td>
        <td>{get #arch event}</td>
        <td>{get #projectId event}</td>
    </tr>
|]
