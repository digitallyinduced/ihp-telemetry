module Admin.View.Events.Index where
import Admin.View.Prelude

data IndexView = IndexView
    { events :: [Event]
    , dailyActiveProjects :: [(UTCTime, Int)]
    , weeklyActiveProjects :: [(UTCTime, Int)]
    , totalEventsOverTime :: [(UTCTime, Int)]
    , totalProjectsOverTime :: [(UTCTime, Int)]
    }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <h1>IHP Telemetry</h1>
        <div class="row">
            <div class="col">
                <h2>Daily Active Projects</h2>
                <div
                    id="daily-active-projects"
                    data-dates={map fst dailyActiveProjects |> jsonDates}
                    data-values={map snd dailyActiveProjects |> jsonValues}
                    style="height: 250px"
                ></div>
                {renderActiveProjects dailyActiveProjects}
            </div>
            <div class="col">
                <h2>Weekly Active Projects</h2>
                <div
                    id="weekly-active-projects"
                    data-dates={map fst weeklyActiveProjects |> jsonDates}
                    data-values={map snd weeklyActiveProjects |> jsonValues}
                    style="height: 250px"
                ></div>
                {renderActiveProjects weeklyActiveProjects}
            </div>
            <div class="col">
                <h2>Total Projects Over Time</h2>
                <div
                    id="total-projects-over-time"
                    data-dates={map fst totalProjectsOverTime |> jsonDateTimes}
                    data-values={map snd totalProjectsOverTime |> jsonValues}
                    style="height: 250px"
                ></div>
                {renderActiveProjects totalProjectsOverTime}
            </div>
            <div class="col">
                <h2>Total Events Over Time</h2>
                <div
                    id="total-events-over-time"
                    data-dates={map fst totalEventsOverTime |> jsonDates}
                    data-values={map snd totalEventsOverTime |> jsonValues}
                    style="height: 250px"
                ></div>
                {renderActiveProjects totalEventsOverTime}
            </div>
        </div>
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

jsonValues :: [Int] -> Text
jsonValues values = "[" <> intercalate "," (map (\v -> tshow v) values) <> "]"

jsonDates :: [UTCTime] -> Text
jsonDates dates = "[" <> intercalate "," (map (\d -> tshow (formatTime defaultTimeLocale "%0Y-%m-%d" d)) dates) <> "]"

jsonDateTimes :: [UTCTime] -> Text
jsonDateTimes dates = "[" <> intercalate "," (map (\d -> tshow (formatTime defaultTimeLocale "%0Y-%m-%d %H:%M:%S" d)) dates) <> "]"

renderActiveProjects activeProjects = [hsx|
    <table class="table table-sm table-hover">
        <thead>
            <tr>
                <th>Date</th>
                <th>Active Projects</th>
            </tr>
        </thead>
        <tbody>{forEach activeProjects renderRow}</tbody>
    </table>
|]
    where


        renderRow (rowDate, rowCount) = [hsx|
            <tr>
                <td>{date rowDate}</td>
                <td>{rowCount}</td>
            </tr>
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
