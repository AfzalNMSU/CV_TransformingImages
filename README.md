1 COMPUTING THE INVERSE TRANSFORM MATRIX
For several specific transforms, such as scaling, rotation, translation, reflections, and shear, using closed-form expression to compute the inverse of the corresponding transform matrix is faster than using the inv function in MATLAB. 
Also, numerically, the closed form expression yields more stable results. Here we will obtain the closed form expressionsfor the inverses of translation, rotation, reflection, and shear matrices.

1. In class, we saw how to compute the inverse of the scaling matrix, not by a linear algebra approach but by intuiting what it means to scale downwards (shrinking is the multiplicative inverse of enlarging). Similarly, compute the inverse of a translation matrix.
Hint: think about what it means to invert translation. We saw that inverting scaling means performing the opposite of the particular scaling transform: if you were enlarging the image to get the transformed image,
then the image itself is a shrunk version of the transformed image, and vice versa. Apply a similar intuition for translation

![image](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/093356db-c7c8-4dca-a346-fe8ab8fe90bc)

Translation Matrix:
     1     0     3
     0     1    -2
     0     0     1

Inverse Translation Matrix:
     1     0    -3
     0     1     2
     0     0     1



     
2. Using the same intuitions as what you used above, invert a rotation matrix. There is a fundamental relationship between a rotation matrix and its inverse. Can you identify this relationship?

![image](https://github.com/AfzalNMSU/CV_TransformingImages/assets/83153124/2463f2a7-9dc0-4799-bcca-4efa5d87b477)

Rotation Matrix:
    0.5000   -0.8660         0
    0.8660    0.5000         0
         0         0    1.0000

Inverse Rotation Matrix:
    0.5000    0.8660         0
   -0.8660    0.5000         0
         0         0    1.0000

The fundamental relationship between a rotation matrix and its inverse is that the inverse of a rotation matrix is equal to its transpose. 

This relationship arises from the properties of orthogonal matrices. Rotation matrices are orthogonal matrices, meaning that their columns (and rows) are orthonormal vectors (i.e., they have a length of 1 and are mutually perpendicular). For an orthogonal matrix, the transpose of is equal to its inverse. This is because the transpose of an orthogonal matrix maintains the orthogonality of its columns, and the dot product of any column with any other column (or row) remains 0, which is a defining property of orthogonal matrices. Therefore, for rotation matrices, taking the transpose effectively "undoes" the rotation operation, making it equivalent to the inverse rotation. This property simplifies the computation of inverse rotation matrices.

     
