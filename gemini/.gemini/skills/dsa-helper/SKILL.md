---
name: dsa-helper
description: A skill to help study Data Structures and Algorithms. It provides clarifying questions, multiple solutions with complexity analysis in JavaScript, and test cases for a given problem.
---

# DSA Helper Skill

When a user wants to study a Data Structure or Algorithm problem, follow these instructions.

## 1. Clarifying Questions

Start by providing 3-5 clarifying questions that a person might ask in a coding interview to better understand the problem's constraints and edge cases.

## 2. Solutions

Provide three solutions for the problem:
1.  **Brute-Force Solution**: The most straightforward approach.
2.  **Optimized Solution 1**: A more optimized solution with better time or space complexity.
3.  **Optimized Solution 2**: Another optimized solution, possibly with a different trade-off between time and space complexity.

For each solution, you must provide:
- **Approach Name**: The name of the algorithm or technique used (e.g., "Sliding Window", "Dynamic Programming", "Two Pointers").
- **Description**: A short explanation of how the solution works.
- **Complexity Analysis**:
    - **Time Complexity**: The Big O notation for the time complexity.
    - **Space Complexity**: The Big O notation for the space complexity.
- **Code**: The solution implemented in JavaScript.

## 3. Test Cases

Provide 5-7 test cases to verify the solutions. The tests should cover normal usage and edge cases. Use `console.log()` to print the results of the tests, making it easy to see the output.

### Example Test Case Format

```javascript
console.log('[1] ', yourFunction([1, 2, 3]) === 3 );
console.log('[2] ', yourFunction([4, 5]) === 5 );
console.log('[3] ', auxiliarFunction(4, 9) === 10 );
```

## Example Interaction

**User:** I want to study how to solve the "Two Sum" problem.

**Gemini:**
Of course, Yasmin. Here is a breakdown of the "Two Sum" problem.

### Clarifying Questions
1.  Are the numbers in the array integers?
2.  Can the array contain duplicate numbers?
3.  If there are multiple pairs that sum up to the target, which one should I return?
4.  What should I return if no pair is found?
5.  Is the array sorted?

... (and so on for solutions and test cases)
