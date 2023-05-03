CREATE DATABASE todo;

USE todo;

CREATE TABLE tasks (
  task_id INT PRIMARY KEY AUTO_INCREMENT,
  task_name VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  is_completed BOOLEAN NOT NULL DEFAULT false
);



-- 1.Inserting data into the "tasks" table
INSERT INTO tasks (task_name, description, is_completed)
VALUES ('Task 1', 'This is the description for task 1', false),
       ('Task 2', 'This is the description for task 2', true),
       ('Task 3', 'This is the description for task 3', false),
       ('Task 4', 'This is the description for task 4', true);

-- 2. Selecting all the columns from the "tasks" table
SELECT * FROM tasks;

-- 3. Selecting specific columns from the "tasks" table
SELECT task_name, description FROM tasks;

-- 4. Selecting completed tasks from the "tasks" table
SELECT * FROM tasks WHERE is_completed = true;

-- 5. Updating the "is_completed" column for a specific task
UPDATE tasks SET is_completed = true WHERE task_id = 1;

-- 6. Deleting a specific task from the "tasks" table
DELETE FROM tasks WHERE task_id = 4;

-- 7. Counting the number of tasks in the "tasks" table
SELECT COUNT(*) FROM tasks;
