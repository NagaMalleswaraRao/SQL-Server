--contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are 0.
--Colleges, Challenges, View_Stats, Submission_Stats
With CTE as
(
Select C.challenge_id, C.college_id, G.contest_id,
Sum(total_views) as total_views,Sum(total_unique_views) as total_unique_views,
Sum(total_submissions) as total_submissions,
Sum(total_accepted_submissions) as total_accepted_submissions    
From Challenges C
Left Join Colleges G
on C.college_id =G.college_id 
Left Join (Select challenge_id, Sum(total_views) as total_views,
           Sum(total_unique_views) as total_unique_views
           From View_Stats
          Group by challenge_id) V
on C.challenge_id =V.challenge_id  
Left Join (Select challenge_id, Sum(total_submissions) as total_submissions,
            Sum(total_accepted_submissions) as total_accepted_submissions
           From Submission_Stats
          Group by challenge_id) S
on C.challenge_id =S.challenge_id 
Group by C.challenge_id, C.college_id, G.contest_id
)

Select T.contest_id, C.hacker_id, C.name,
Sum(total_submissions), Sum(total_accepted_submissions),
Sum(total_views), Sum(total_unique_views)
From CTE T
Left Join Contests C
on C.contest_id=T.contest_id
Group by T.contest_id, C.hacker_id, C.name
Having Sum(total_submissions)+Sum(total_accepted_submissions)+
Sum(total_views)+ Sum(total_unique_views)<>0
--Sum(total_submissions)<>0 or Sum(total_accepted_submissions)<>0
--or Sum(total_views)<>0 or Sum(total_unique_views)<>0
Order by T.contest_id

