Include = 'keywords.g'
#Include = 'kin-stickHandover.g'

FOL_World{
  hasWait=false
  gamma = 1.
  stepCost = 1.
  timeCost = 0.
}

## activities
grasping
placing
handing
attaching
pushing

## basic predicates
gripper
object
table
wall
attachable
pusher
partOf
world

on
busy     # involved in an ongoing (durative) activity
animate  # the object is in principle movable
free     # gripper hand is free
held     # object is held by an gripper
notheld  # triggers the rule to set !held for all parts
grasped  # gripper X holds/has grasped object Y
placed   # gripper X holds/has grasped object Y
attached
hasScrew # gripper X holds a screw (screws are not objects/constrants, just a predicate of having a screw...)
fixed    # object X and Y are fixed together
never    # (for debugging)

## KOMO symbols
inside
above
lift
notAbove

touch
impulse
stable
stableOn
dynamic
dynamicOn
liftDownUp

fricSlide
dynamicVert
flagClear

## constants (added by the code)
obj0
obj1
obj2
obj3
tray
redBall
blueBall
bucket

## initial state (generated by the code)
START_STATE {}

### RULES

#####################################################################

#termination rule
#Rule {
#  { (on obj0 tray) (on obj1 tray) (on obj2 tray) }
#  { (QUIT) }
#}

### Reward
REWARD {
#  tree{
#    leaf{ { (grasped handR screwdriverHandle) }, r=10. }
#    weight=1.
#  }
}

#####################################################################

DecisionRule grasp {
  X, Y
  { (gripper X) (object Y) (busy X)! (held Y)! (INFEASIBLE grasp X Y)! }
  { (grasped X Y) (held Y) (busy X) komo(touch X Y) (stable X Y) (stableOn ANY Y)!  } #komo(liftDownUp X) #komo(grasp X Y) } #komo(lift X)
}

#####################################################################

DecisionRule place {
  X, Y, Z,
  { (grasped X Y) (table Z) (held Y) }
  { (placed Y Z) (on Y Z) (grasped X Y)! komo(touch X Y) (busy X)! (busy Y)! (notheld Y) (INFEASIBLE grasp ANY Y)! block(INFEASIBLE grasp ANY Y) komo(above Y Z) (stableOn Z Y) (stable ANY Y)! } #komo(liftDownUp X) #komo(place X Y Z)=1. }
}

#####################################################################

Rule {
  A
  { (notheld A) }
  { (held A)! }
}
