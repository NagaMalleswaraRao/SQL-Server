With LM_CTE as
(
Select T.company_code, Count(T.lead_manager_code) as No_of_LMs
From (select distinct * from Lead_Manager) T
Group by T.company_code
),

SM_CTE as
(
Select T.company_code, Count(T.senior_manager_code) as No_of_SMs
From (select distinct company_code,senior_manager_code from Senior_Manager) T
Group by T.company_code
),

M_CTE as
(
Select T.company_code, Count(T.manager_code) as No_of_Ms
From (select distinct company_code,manager_code from Manager) T
Group by T.company_code
),

EM_CTE as
(
Select T.company_code, Count(T.employee_code) as No_of_EMs
From (select distinct company_code,employee_code from Employee) T
Group by T.company_code
)

Select C.*, LM.No_of_LMs, SM.No_of_SMs, M.No_of_Ms, EM.No_of_EMs
--, Cast(Replace(C.company_code,"C.","") as int) as Sort_Order
From (Select distinct * from Company) C
Left Join LM_CTE LM
on C.company_code=LM.company_code
Left Join SM_CTE SM
on C.company_code=SM.company_code
Left Join M_CTE M
on C.company_code=M.company_code
Left Join EM_CTE EM
on C.company_code=EM.company_code

Order by Cast(Replace(C.company_code,"C","") as int)
