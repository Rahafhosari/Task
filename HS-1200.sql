SELECT COUNT(tk) 
FROM TaskData tk 
WHERE tk.taskActivatior = :sessionUser OR tk.department = :department 
AND (
    CAST(tk.taskId AS string) LIKE :filter 
    OR CAST(tk.caseId AS string) LIKE :filter 
    OR LOWER(tk.taskName) LIKE LOWER(:filter) 
    OR LOWER(tk.taskActivatior) LIKE LOWER(:filter) 
    OR LOWER(tk.status) LIKE LOWER(:filter) 
    OR TO_CHAR(tk.startDate, 'DD.MM.YYYY HH24:MI') LIKE :filter
    ) 
ORDER BY tk.taskId ASC


SELECT COUNT(tk)
FROM TaskData tk
WHERE (tk.taskActivatior = :sessionUser OR tk.department = :department)
AND (
    CAST(tk.taskId AS string) LIKE '%' || :filter || '%' 
    OR CAST(tk.caseId AS string) LIKE '%' || :filter || '%' 
    OR LOWER(tk.taskName) LIKE LOWER('%' || :filter || '%') 
    OR LOWER(tk.taskActivatior) LIKE LOWER('%' || :filter || '%') 
    OR LOWER(tk.status) LIKE LOWER('%' || :filter || '%') 
    OR TO_CHAR(tk.startDate, 'DD.MM.YYYY HH24:MI') LIKE '%' || :filter || '%'
)
ORDER BY tk.taskId ASC



