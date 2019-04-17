# JPMC
Project to show case REST API calls and implement it using MVVM. Collection view used to prefetch the data so it can be super scroll.


#  Vishal kumar 
Below is high level explanation of the code base.

Code Divided into Below.
-Service Layer
-Service Helper
-Model
-ViewModel
-Controller
-Binding Data
-State Of View

Service Layer :- Implemented a separate servcie layer which can be easly accessed across the project.Used Codeable to parse the JSON response. 

NYSchool List:
Service Helper :-  Idea is to call the servcie layer via service helper class so that code can be organised for each and every servcie call. This will  only have reqeust and response formation.

CollectionView:- Implemented Collection view with prefetch delegate and limiter(20-19 elements at a time) used in the url request to get super smooth scroll.TableView is used on top of collection view.

VM:- This class will not have any UI components only used to get all the UI elements ready.

Utility React Class :- React coponent is used to bind the data 

State of the Task is maintained to so that for differnt operation can be handled i.e isEmpty,loading,loaded etc.

I have more concentrated on writing clean code in swift.

I have used different design patterns to make code clean, implement MVVM ,Maintained separate service layer on top of it i wrote servcie helper classes with protocol extension so that in future it can be use easily , made good use of computed variables.

Please dont judge based on UI :P

Feel free to provide your comments.


