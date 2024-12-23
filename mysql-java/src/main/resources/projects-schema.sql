-- Drop existing tables
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;

-- Create the project table
CREATE TABLE project (
	project_id INT NOT null AUTO_INCREMENT,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY (project_id)
);

-- Create the material table
CREATE TABLE material (
	material_id INT NOT null AUTO_INCREMENT,
	project_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2),
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

-- Create the step table
CREATE TABLE step (
	step_id INT  NOT null AUTO_INCREMENT,
	project_id INT NOT NULL,
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY (step_id),
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

-- Create the category table
CREATE TABLE category (
	category_id INT NOT null AUTO_INCREMENT,
	category_name VARCHAR(128) NOT NULL,
	PRIMARY KEY (category_id)
);

-- Create the project/category table
CREATE TABLE project_category (
	project_id INT, -- Foreign Key
	category_id INT, -- Foreign Key
	PRIMARY KEY (project_id, category_id), -- Composite Primary Key
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
);


INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes)
VALUES	
('Organize Garage', 5, 4, 2, 'Clear out old boxes and install new shelves.'),
('Plant a Garden', 8, 10, 3, 'Set up a small vegetable garden with raised beds.'),
('Build a Bookshelf', 6, 7, 4, 'Assembled a custom wooden bookshelf for the living room.')

NSERT INTO category (category_name) VALUES ('Home Organization');

INSERT INTO material (project_id, material_name, num_required, cost) 
VALUES 
(2, 'Storage bins', 5, 10.00),
(2, 'Wall hooks', 10, 0.75),
(2, 'Shelving units', 2, 45.00);

INSERT INTO step (project_id, step_text, step_order)
VALUES 
(2, 'Clear out all items from the garage', 1),
(2, 'Sort items into categories: keep, donate, or discard', 2),
(2, 'Install shelving units and wall hooks', 3),
(2, 'Place items back into the garage, organized in storage bins', 4);

INSERT INTO project_category (project_id, category_id) 
VALUES (2, 2);

-- next row -- 

INSERT INTO category (category_name) VALUES ('Gardening');

INSERT INTO material (project_id, material_name, num_required, cost) 
VALUES 
(3, 'Garden soil bags', 4, 8.50),
(3, 'Seed packets', 6, 2.00),
(3, 'Watering can', 1, 15.00);

INSERT INTO step (project_id, step_text, step_order)
VALUES 
(3, 'Choose a location with good sunlight for the garden', 1),
(3, 'Prepare the soil by loosening and leveling the area', 2),
(3, 'Plant seeds according to their specific requirements', 3),
(3, 'Water the soil thoroughly and regularly', 4);

INSERT INTO project_category (project_id, category_id) 
VALUES (3, 3);

-- next row --

INSERT INTO category (category_name) VALUES ('DIY Projects');

INSERT INTO material (project_id, material_name, num_required, cost) 
VALUES 
(4, 'Wood planks', 6, 12.00),
(4, 'Wood screws', 30, 0.10),
(4, 'Wood glue', 1, 5.00),
(4, 'Sandpaper', 3, 2.50);

INSERT INTO step (project_id, step_text, step_order)
VALUES 
(4, 'Cut wood planks to the required dimensions', 1),
(4, 'Sand the edges of each plank for smoothness', 2),
(4, 'Assemble the frame using screws and wood glue', 3),
(4, 'Install shelves into the frame', 4),
(4, 'Paint or finish the bookshelf as desired', 5);

INSERT INTO project_category (project_id, category_id) 
VALUES (4, 4);

-- End of INSERTS --

SELECT * FROM project