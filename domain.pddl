;; References
;; Helmert, M. (October 16th). An Introduction to PDDL.
;;
(define (domain floor-tile)

	;; We only require some typing to make this plan faster. 
    ;; We can do without!
	(:requirements :typing)

	;; There are two types: robot and the tiles, both are 
    ;; objects
	(:types robot tile - object)

	;; define all the predicates as they are used in the problem 
    ;; files
	(:predicates  

    ;; describes what tile a robot is at
    (robot-at ?c - robot ?x - tile)

    
    ;; indicates that tile ?x is above tile ?y
    (up ?x - tile ?y - tile)

    ;; indicates that tile ?x is below tile ?y
    (down ?x - tile ?y - tile)

    ;; indicates that tile ?x is to the right of tile ?y
    (right ?x - tile ?y - tile)

    ;; indicates that tile ?x is to the left of tile ?y
    (left ?x - tile ?y - tile)
    
    ;; described a tile ?x is clear (no robot is at that 
    ;; tile)
    (clear ?x - tile)
     
    ;; indicates that a tile is cleaned
    (cleaned ?x - tile)
 	)

 ;; Action definitions

 ;; cleans the tile if it is above the robot
 (:action clean-up
  :parameters (?c - robot ?r - tile ?q - tile)
  ;; if the tile is above the robot, the tile above is 
  ;; not already clean and if the tile above is clear of other 
  ;; robots
  :precondition (
                 and 
                 (up ?r ?q) 
                 (robot-at ?c ?q)
                 (not(cleaned ?r))
                 (clear ?r)
                ) 
  ;; now the tile is cleaned
  :effect (
           and 
           (cleaned ?r) 
          )
 )
  
 ;; cleans the tile if it is above the robot
 (:action clean-down 
  :parameters (?c - robot ?r - tile ?q - tile)
  ;; if the tile is below the robot, the tile below is 
  ;; not already clean and if the tile below is clear of other 
  ;; robots
  :precondition (
                 and 
                 (down ?r ?q) 
                 (robot-at ?c ?q)
                 (not(cleaned ?r)) 
                 (clear ?r)
                ) 
  ;; now the tile is cleaned
  :effect (
           and 
           (cleaned ?r) 
          )
 )

  (:action up
  :parameters (?c - robot ?r - tile ?q - tile)
  ;; if the tile is above the robot and the tile is not 
  ;; cleaned and is clear of other robots
  :precondition (
                 and 
                 (up ?r ?q) 
                 (robot-at ?c ?q)
                 (not(cleaned ?r)) 
                 (clear ?r) 
                ) 
  ;; now robot is not in the tile it was in and it is in the
  ;; tile that was above it
  :effect (
           and 
           (not(robot-at ?c ?q)) 
           (robot-at ?c ?r) 
           (clear ?q)
		   (not(clear ?r))
          )
 )
  
  (:action down
  :parameters (?c - robot ?r - tile ?q - tile)
  ;; if the tile is below the robot and the tile is not 
  ;; cleaned and is clear of other robots
  :precondition (
                 and 
                 (down ?r ?q)
                 (robot-at ?c ?q)
                 (not(cleaned ?r)) 
                 (clear ?r) 
                ) 
  ;; now robot is not in the tile it was in and it is in the
  ;; tile that was below it
  :effect (
           and 
           (not(robot-at ?c ?q)) 
           (robot-at ?c ?r) 
           (clear ?q)
		   (not(clear ?r))
          )
 )
  
  (:action left
  :parameters (?c - robot ?r - tile ?q - tile)
  ;; if the tile is left of the robot and the tile is not 
  ;; cleaned and is clear of other robots
  :precondition (
                 and 
                 (left ?r ?q) 
                 (robot-at ?c ?q)
                 (not(cleaned ?r)) 
                 (clear ?r) 
                ) 
  ;; now robot is not in the tile it was in and it is in the
  ;; tile that was left of it
  :effect (
           and 
           (not(robot-at ?c ?q)) 
           (robot-at ?c ?r) 
           (clear ?q)
		   (not(clear ?r))
          )
 )
  
  (:action right
  :parameters (?c - robot ?r - tile ?q - tile)
  ;; if the tile is right of the robot and the tile is not 
  ;; cleaned and is clear of other robots
  :precondition (
                 and 
                 (right ?r ?q) 
                 (robot-at ?c ?q)
                 (not(cleaned ?r)) 
                 (clear ?r) 
                ) 
  ;; now robot is not in the tile it was in and it is in the
  ;; tile that was right of it
  :effect (
           and 
           (not(robot-at ?c ?q)) 
           (robot-at ?c ?r) 
           (clear ?q)
		   (not(clear ?r))
          )
 )
)

