# mine


There is a field of mines. Each mine is identified by a 2d-coordinate and a blast radius. When a mine explodes at time interval t, it explodes mines that lay within its blast radius at t + 1.

Given a list of mines consisting of their X & Y coordinates and radius (ex 2, 2, 5), write a program that finds which mine in the list triggers the most explosions in the fewest number of time intervals. Use the Euclidean distance to determine whether a mine lays within the radius of another mine. Your program should produce an output file showing the results, including identifying the mine that triggers the most intense explosions.

A sample mines files is attached.

Running tests Install minitest gem and run `ruby -Ilib:test tests/*`

Running program -> `ruby land_mines.rb <input file name> <output file name>`


