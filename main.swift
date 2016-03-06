//
//  main.swift
//  斐波那契
//
//  Created by 郑啸宇 on 15/4/6.
//  Copyright (c) 2015年 郑啸宇. All rights reserved.
//
import Foundation
struct Matrix {
    var rows: Int, columns: Int
    var grid: [Int]
    init() {
        self.rows = 2
        self.columns = 2
        grid = Array(count: rows * columns, repeatedValue: 0)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Int {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

func multiply(x:Matrix, y:Matrix)-> Matrix{
    var mul = Matrix()
    for i in 0...1 {
        for j in 0...1{
            mul[i,j]=0
            for k in 0...1{
                mul[i,j] += x[i,k]*y[k,j]
            }
        }
    }
    return mul
}
var base = Matrix()
base[0,0] = 1
base[0,1] = 1
base[1,0] = 1
base[1,1] = 0
var ans = Matrix()

func power(e : UInt32)->Matrix{
    if(e == 0)
    {
        ans[0,0] = 1
        ans[0,1] = 0
        ans[1,0] = 0
        ans[1,1] = 1
        return ans
        
    }
    if (e == 1)
    {return base}
    
    ans = power(e>>1);
    ans = multiply(ans, ans);
    if(Int(e) % 2 == 1)
    {ans = multiply(ans,base)}
    return ans
}

var mat = Matrix()
var time_1 = clock()
var time_2 = clock()
for n in 1...61{
    if(n == 1) {println(1)}
    else {
        time_1 = clock()
        mat = power(UInt32(n-1))
        time_2 = clock()
        //println(mat[0,0])
        println(time_2 - time_1)

    }
}
