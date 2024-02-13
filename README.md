1 COMPUTING THE INVERSE TRANSFORM MATRIX
For several specific transforms, such as scaling, rotation, translation, reflections, and shear, using closed-form expression to compute the inverse of the corresponding transform matrix is faster than using the inv function in MATLAB. 
Also, numerically, the closedform expression yields more stable results. Here we will obtain the closed-form expressionsfor the inverses of translation, rotation, reflection, and shear matrices.

1. In class, we saw how to compute the inverse of the scaling matrix, not by a linear algebra approach but by intuiting what it means to scale downwards (shrinking is the multiplicative inverse of enlarging). Similarly, compute the inverse of a translation matrix.
Hint: think about what it means to invert translation. We saw that inverting scaling means performing the opposite of the particular scaling transform: if you were enlarging the image to get the transformed image,
then the image itself is a shrunk version of the transformed image, and vice versa. Apply a similar intuition for translation

Translation Matrix:
     1     0     3
     0     1    -2
     0     0     1

Inverse Translation Matrix:
     1     0    -3
     0     1     2
     0     0     1

     
