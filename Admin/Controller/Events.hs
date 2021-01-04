module Admin.Controller.Events where

import Admin.Controller.Prelude
import Admin.View.Events.Index
import Admin.View.Events.New
import Admin.View.Events.Edit
import Admin.View.Events.Show

instance Controller EventsController where
    action EventsAction = do
        events <- query @Event
            |> orderBy #createdAt
            |> fetch

        dailyActiveProjects <- sqlQuery "SELECT date, COUNT(distinct project_id) AS count FROM (SELECT date_trunc('day', events.created_at) AS date, project_id FROM events) AS events_with_date GROUP BY date" ()
        weeklyActiveProjects <- sqlQuery "SELECT date, COUNT(distinct project_id) AS count FROM (SELECT date_trunc('week', events.created_at) AS date, project_id FROM events) AS events_with_date GROUP BY date" ()
        monthlyActiveProjects <- sqlQuery "SELECT date, COUNT(distinct project_id) AS count FROM (SELECT date_trunc('month', events.created_at) AS date, project_id FROM events) AS events_with_date GROUP BY date" ()
        totalEventsOverTime <- sqlQuery "SELECT date, SUM(COUNT(*)) OVER (ORDER BY date)::int FROM (SELECT date_trunc('day', events.created_at) AS date, project_id FROM events) AS events_with_date GROUP BY date" ()
        totalProjectsOverTime <- sqlQuery "SELECT created_at, sum(count(project_id)) OVER (ORDER BY created_at)::int FROM (SELECT DISTINCT ON (project_id) created_at, project_id FROM events ORDER BY project_id, created_at) AS subq GROUP BY created_at" ()

        render IndexView { .. }
