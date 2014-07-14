[1mdiff --git a/spec/features/todo_lists/create_spec.rb b/spec/features/todo_lists/create_spec.rb[m
[1mindex 2f771ed..88a5502 100644[m
[1m--- a/spec/features/todo_lists/create_spec.rb[m
[1m+++ b/spec/features/todo_lists/create_spec.rb[m
[36m@@ -1,29 +1,29 @@[m
 require 'spec_helper'[m
 [m
 describe "Creating todo lists" do [m
[31m-	it "redirects to the todo list index page on success" do[m
[32m+[m	[32mdef create_todo_list(options={})[m
[32m+[m		[32moptions[:title] ||= "My todo list"[m
[32m+[m		[32moptions[:description] ||= "This is my todo list"[m
[32m+[m
 		visit "/todo_lists"[m
 		click_link"New Todo list"[m
 		expect(page).to have_content("New todo_list")[m
 [m
[31m-		fill_in "Title", with: "My todo list"[m
[31m-		fill_in "Description", with: "This is what I'm doing today"[m
[32m+[m		[32mfill_in "Title", with: options[:title][m
[32m+[m		[32mfill_in "Description", with: options[:description][m
 		click_button "Create Todo list"[m
[32m+[m	[32mend[m
 [m
[31m-		expect(page).to have_content[m
[32m+[m	[32mit "redirects to the todo list index page on success" do[m
[32m+[m		[32mcreate_todo_list[m
[32m+[m		[32mexpect(page).to have_content("My todo list")[m
 [m
 	end[m
 [m
 	it "displays an error when the todo list has no title" do[m
 		expect(TodoList.count).to eq(0)[m
 		[m
[31m-		visit "/todo_lists"[m
[31m-		click_link"New Todo list"[m
[31m-		expect(page).to have_content("New todo_list")[m
[31m-[m
[31m-		fill_in "Title", with: ""[m
[31m-		fill_in "Description", with: "This is what I'm doing today"[m
[31m-		click_button "Create Todo list"[m
[32m+[m		[32mcreate_todo_list title:""[m
 [m
 		expect(page).to have_content("error")[m
 		expect(TodoList.count).to eq(0)[m
[36m@@ -34,14 +34,9 @@[m [mdescribe "Creating todo lists" do[m
 [m
 	it "displays an error when the todo list has a title less than 3 characters" do[m
 		expect(TodoList.count).to eq(0)[m
[31m-		[m
[31m-		visit "/todo_lists"[m
[31m-		click_link"New Todo list"[m
[31m-		expect(page).to have_content("New todo_list")[m
 [m
[31m-		fill_in "Title", with: "Hi"[m
[31m-		fill_in "Description", with: "This is what I'm doing today"[m
[31m-		click_button "Create Todo list"[m
[32m+[m		[32mcreate_todo_list title:"hi"[m
[32m+[m[41m		[m
 [m
 		expect(page).to have_content("error")[m
 		expect(TodoList.count).to eq(0)[m
[36m@@ -52,15 +47,9 @@[m [mdescribe "Creating todo lists" do[m
 [m
 it "displays an error when the todo list has no description" do[m
 		expect(TodoList.count).to eq(0)[m
[31m-		[m
[31m-		visit "/todo_lists"[m
[31m-		click_link"New Todo list"[m
[31m-		expect(page).to have_content("New todo_list")[m
[31m-[m
[31m-		fill_in "Title", with: "Grocery List"[m
[31m-		fill_in "Description", with: ""[m
[31m-		click_button "Create Todo list"[m
 [m
[32m+[m		[32mcreate_todo_list description:""[m
[32m+[m[41m		[m
 		expect(page).to have_content("error")[m
 		expect(TodoList.count).to eq(0)[m
 [m
[36m@@ -70,14 +59,8 @@[m [mit "displays an error when the todo list has no description" do[m
 [m
 it "displays an error when the todo list has a description less than 5 characters" do[m
 		expect(TodoList.count).to eq(0)[m
[31m-		[m
[31m-		visit "/todo_lists"[m
[31m-		click_link"New Todo list"[m
[31m-		expect(page).to have_content("New todo_list")[m
 [m
[31m-		fill_in "Title", with: "Grocery list"[m
[31m-		fill_in "Description", with: "Food"[m
[31m-		click_button "Create Todo list"[m
[32m+[m		[32mcreate_todo_list description:"food"[m
 [m
 		expect(page).to have_content("error")[m
 		expect(TodoList.count).to eq(0)[m
