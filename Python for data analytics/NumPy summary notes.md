In this section I summarize the key elements of **NumPy** learnt from **Jake VanderPlas's Python Data Science Handbook** with some code examples.


### **1. NumPy Arrays: The Core of Numerical Computation**
- **NumPy** is a library for Python that provides support for arrays, which are multi-dimensional, fixed-size containers of items of the same type. This makes NumPy highly efficient for numerical computations. Some of the concepts presented here are very short as I may have covered them in my Jupyter Notebook on NumPy as I had to refresh my memory. I felt like I was starting from zero when I went back to the notebook and I had more questions than when I was doing it the first time. 

#### **1.1 Creating NumPy Arrays**
- NumPy arrays can be created from Python lists using `np.array`.

```python
import numpy as np

# Creating a simple 1D array from a Python list
arr_1d = np.array([1, 2, 3, 4, 5])
print(arr_1d)

# Creating a 2D array (matrix)
arr_2d = np.array([[1, 2, 3], [4, 5, 6]])
print(arr_2d)
```

- NumPy functions to create arrays with specific properties:
  - `np.zeros()`: Create an array filled with zeros.
  - `np.ones()`: Create an array filled with ones.
  - `np.full()`: Create an array filled with a specified value.
  - `np.arange()`: Create an array with a range of values (similar to Python’s `range()`).
  - `np.linspace()`: Create an array with evenly spaced values between a range.

```python
# Creating arrays with specific values
zeros_arr = np.zeros((2, 3))   # 2x3 array of zeros
ones_arr = np.ones((3, 2))     # 3x2 array of ones
full_arr = np.full((2, 2), 7)  # 2x2 array filled with 7
range_arr = np.arange(0, 10, 2)  # Array from 0 to 10 with step size of 2
linspace_arr = np.linspace(0, 1, 5)  # Array with 5 evenly spaced values from 0 to 1
```

#### **1.2 Array Attributes**
- Understanding the structure and type of arrays is important:
  - `ndim`: Number of dimensions.
  - `shape`: Size of each dimension.
  - `size`: Total number of elements.
  - `dtype`: Data type of elements.

```python
print(arr_2d.ndim)    # 2D array, so ndim = 2
print(arr_2d.shape)   # (2, 3) means 2 rows, 3 columns
print(arr_2d.size)    # Total number of elements = 6
print(arr_2d.dtype)   # Data type of array elements
```

---

### **2. Array Indexing and Slicing**
- NumPy arrays support indexing and slicing similar to Python lists but can be applied across multiple dimensions.

```python
# 1D array indexing
arr = np.array([10, 20, 30, 40, 50])
print(arr[1])    # Accessing the second element, output: 20

# 2D array slicing
arr_2d = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
print(arr_2d[0, 2])   # Accessing the element at first row, third column, output: 3
print(arr_2d[1:, :2]) # Slicing rows 1 onward, columns 0 and 1, output: [[4, 5], [7, 8]]
```

---

### **3. Array Operations**
- **Element-wise operations**: Operations on NumPy arrays are applied element-wise.

```python
arr = np.array([1, 2, 3, 4])

# Arithmetic operations
print(arr + 2)  # Add 2 to each element
print(arr * 3)  # Multiply each element by 3
print(arr ** 2) # Square each element

# Mathematical functions
arr2 = np.array([1, 2, 3, 4])
print(np.sin(arr2))  # Apply sine function element-wise
```

#### **3.1 Aggregation Functions**
- Functions like `sum()`, `min()`, `max()`, `mean()`, and `std()` can be applied to NumPy arrays for statistical summaries.

```python
arr = np.array([1, 2, 3, 4, 5])

print(np.sum(arr))   # Sum of all elements
print(np.mean(arr))  # Mean of the array
print(np.min(arr))   # Minimum value
print(np.std(arr))   # Standard deviation
```

#### **3.2 Broadcasting**
- **Broadcasting** allows NumPy to perform operations on arrays of different shapes in a way that would otherwise require a loop.

```python
arr = np.array([1, 2, 3])
matrix = np.array([[10], [20], [30]])

# Broadcasting: adding a 1D array to each row of a 2D array
print(arr + matrix)
```

---

### **4. Reshaping Arrays**
- NumPy provides powerful methods for changing the shape of an array without altering its data, such as `reshape()` and `ravel()`.

```python
arr = np.arange(1, 13)  # 1D array from 1 to 12
reshaped = arr.reshape(3, 4)  # Reshaped to a 3x4 matrix
print(reshaped)

flattened = reshaped.ravel()  # Flatten back to 1D
print(flattened)
```

---

### **5. Stacking and Splitting Arrays**
- **Concatenating** and **splitting** arrays can be done using functions like `np.concatenate()`, `np.hstack()`, `np.vstack()`, and `np.split()`.

```python
arr1 = np.array([1, 2, 3])
arr2 = np.array([4, 5, 6])

# Stacking arrays horizontally (row-wise) and vertically (column-wise)
hstacked = np.hstack([arr1, arr2])  # Output: [1 2 3 4 5 6]
vstacked = np.vstack([arr1, arr2])  # Output: [[1 2 3], [4 5 6]]

# Splitting arrays
split_arr = np.split(hstacked, 3)  # Split into 3 equal parts
```

---

### **6. Universal Functions (ufuncs)**
- NumPy provides **vectorized functions** called ufuncs that operate on arrays element-wise for faster execution.
  - Examples include `np.add()`, `np.multiply()`, `np.sqrt()`, and more.

```python
arr = np.array([1, 4, 9, 16])

# Universal function example: square root
print(np.sqrt(arr))  # Output: [1. 2. 3. 4.]
```

---

### **7. Random Numbers**
- NumPy has a powerful **random module** for generating random numbers, sampling, and random distributions.

```python
# Generating random numbers
random_arr = np.random.random((3, 3))  # 3x3 array of random numbers between 0 and 1
random_ints = np.random.randint(1, 10, size=(3, 3))  # Random integers between 1 and 10
```

---

### **8. Performance and Memory Efficiency**
- One of NumPy's key advantages is its efficiency with large datasets due to contiguous memory layout. Functions like `np.vectorize` and `np.fromfunction` can optimize operations.

```python
# Vectorizing functions for speed
def my_func(x):
    return x ** 2 + 3 * x - 4

vectorized_func = np.vectorize(my_func)
arr = np.array([1, 2, 3, 4])
print(vectorized_func(arr))
```

---

### **Conclusion: NumPy Workflow Summary**
- **Create** arrays using `np.array()`, `np.zeros()`, or `np.arange()`.
- **Index and slice** arrays efficiently.
- Perform **element-wise operations**, use **ufuncs** for fast computations.
- **Reshape** arrays with `reshape()`, **concatenate** with `np.hstack()` or `np.vstack()`.
- Use **aggregation** functions like `sum()`, `mean()`, and **random** number generation for simulations.
  
---
