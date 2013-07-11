/*
 * trans.c - Matrix transpose B = A^T
 *
 * Wei Chen, weichen1@andrew.cmu.edu
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */
#include <stdio.h>
#include "cachelab.h"
#include "contracts.h"

/***********
 * helpers
 * ********/
int local_min(int a, int b) {
    return a < b ? a : b;
}


int is_transpose(int M, int N, int A[N][M], int B[M][N]);

void transpose_dia_block(int M, int N, int A[N][M], int B[M][N], int sizea, int sizeb){
    int ii, jj, i, j;
    int tmp;
    REQUIRES(M > 0);
    REQUIRES(N > 0);

    for(ii = 0; ii < N; ii += sizea) {
        for(jj = 0; jj < M; jj += sizeb) {
            for(i = ii; i < local_min(ii + sizea, N); ++i) {
                for(j = jj; j < local_min(jj + sizeb, M); ++j) {
                    if (i - ii != j - jj) {
                        B[j][i] = A[i][j];
                    } else {
                        tmp = A[i][j];
                    }
                }
                for(j = jj; j < local_min(jj + sizeb, M); ++j) {
                    if (i - ii == j - jj) {
                        B[j][i] = tmp;
                    }
                }
            }
        }
    }
    ENSURES(is_transpose(M, N, A, B));
}

char transpose_32_32_desc[] = "Transpose big sub matrix, and smaller matrix";
void transpose_32_32(int M, int N, int A[N][M], int B[M][N]){
    int ii, jj, i, j;
    int a1, a2, a3, a4, a5, a6, a7, a8;
    REQUIRES(M > 0);
    REQUIRES(N > 0);

    for(ii = 0; ii < N; ii += 8) {
        for(jj = 0; jj < M; jj += 8) {
            if ( ii != jj ) {
                // up 4 lines
                for (i = 0; i < 4; ++i) {
                    a1 = A[ii + i][jj];
                    a2 = A[ii + i][jj+1];
                    a3 = A[ii + i][jj+2];
                    a4 = A[ii + i][jj+3];
                    a5 = A[ii + i][jj+4];
                    a6 = A[ii + i][jj+5];
                    a7 = A[ii + i][jj+6];
                    a8 = A[ii + i][jj+7];

                    B[jj + i][ii] = a1;
                    B[jj + i][ii+1] = a2;
                    B[jj + i][ii+2] = a3;
                    B[jj + i][ii+3] = a4;
                    B[jj + i][ii+4] = a5;
                    B[jj + i][ii+5] = a6;
                    B[jj + i][ii+6] = a7;
                    B[jj + i][ii+7] = a8;
                }
                for (i = jj; i < jj + 4; ++i) {
                    for (j = ii + i - jj; j < ii + 4; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[jj + j - ii][ii + i - jj];
                        B[jj + j - ii][ii + i - jj] = a1;
                    }
                } // transpose upper left
                // down 4 lines
                for (i = 0; i < 4; ++i) {
                    a1 = B[jj + i][ii + 4];
                    a2 = B[jj + i][ii + 5];
                    a3 = B[jj + i][ii + 6];
                    a4 = B[jj + i][ii + 7];

                    a5 = A[ii + 4 + i][jj];
                    a6 = A[ii + 4 + i][jj+1];
                    a7 = A[ii + 4 + i][jj+2];
                    a8 = A[ii + 4 + i][jj+3]; // = 4 miss

                    B[jj + i][ii + 4] = a5;
                    B[jj + i][ii + 5] = a6;
                    B[jj + i][ii + 6] = a7;
                    B[jj + i][ii + 7] = a8; // = 0 miss

                    B[jj + 4 + i][ii] = a1;
                    B[jj + 4 + i][ii+1] = a2;
                    B[jj + 4 + i][ii+2] = a3;
                    B[jj + 4 + i][ii+3] = a4; // = 4 miss

                    a1 = A[ii + 4 + i][jj + 4];
                    a2 = A[ii + 4 + i][jj + 5];
                    a3 = A[ii + 4 + i][jj + 6];
                    a4 = A[ii + 4 + i][jj + 7]; // = 0 miss

                    B[jj + 4 + i][ii + 4] = a1;
                    B[jj + 4 + i][ii + 5] = a2;
                    B[jj + 4 + i][ii + 6] = a3;
                    B[jj + 4 + i][ii + 7] = a4; // = 0 miss
                }

                for (i = jj + 4; i < jj + 8; ++i) {
                    for (j = ii + i - jj; j < ii + 8; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[jj + j - ii][ii + i - jj];
                        B[jj + j - ii][ii + i - jj] = a1;
                    }
                } // transpose down right, = 0 miss

                for (i = jj + 4; i < jj + 8; ++i) {
                    for (j = ii + i - jj - 4; j < ii + 4; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[jj + 4 + j - ii][ii + i - jj - 4];
                        B[jj + 4 + j - ii][ii + i - jj - 4] = a1;
                    }
                } // down left, = 0 miss

                for (i = jj; i < jj + 4; ++i) {
                    for (j = ii + 4 + i - jj; j < ii + 8; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[jj + j - ii - 4][ii + 4 + i - jj];
                        B[jj + j - ii - 4][ii + 4 + i - jj] = a1;
                    }
                } // up right, = 4 miss
            } else if (ii == jj) {
                // up 4 lines, = 8
                for (i = ii; i < ii + 4; ++i) {
                    a1 = A[i][jj];
                    a2 = A[i][jj+1];
                    a3 = A[i][jj+2];
                    a4 = A[i][jj+3];
                    a5 = A[i][jj+4];
                    a6 = A[i][jj+5];
                    a7 = A[i][jj+6];
                    a8 = A[i][jj+7];

                    B[i][jj] = a1;
                    B[i][jj+1] = a2;
                    B[i][jj+2] = a3;
                    B[i][jj+3] = a4;
                    B[i][jj+4] = a5;
                    B[i][jj+5] = a6;
                    B[i][jj+6] = a7;
                    B[i][jj+7] = a8;
                }
                for (i = ii; i < ii + 4; ++i) {
                    for (j = i; j < jj + 4; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[j][i];
                        B[j][i] = a1;
                    }
                }

                for (i = ii; i < ii + 4; ++i) {
                    for (j = i + 4; j < jj + 8; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[j - 4][i + 4];
                        B[j - 4][i + 4] = a1;
                    }
                }

                // down 4 lines, = 8
                for (i = ii + 4; i < ii + 8; ++i) {
                    a1 = A[i][jj];
                    a2 = A[i][jj+1];
                    a3 = A[i][jj+2];
                    a4 = A[i][jj+3];
                    a5 = A[i][jj+4];
                    a6 = A[i][jj+5];
                    a7 = A[i][jj+6];
                    a8 = A[i][jj+7];

                    B[i][jj] = a1;
                    B[i][jj+1] = a2;
                    B[i][jj+2] = a3;
                    B[i][jj+3] = a4;
                    B[i][jj+4] = a5;
                    B[i][jj+5] = a6;
                    B[i][jj+6] = a7;
                    B[i][jj+7] = a8;
                }

                for (i = ii + 4; i < ii + 8; ++i) {
                    for (j = i; j < jj + 8; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[j][i];
                        B[j][i] = a1;
                    }
                }

                for (i = ii + 4; i < ii + 8; ++i) {
                    for (j = jj + i - ii - 4; j < jj + 4; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[j + 4][i - 4];
                        B[j + 4][i - 4] = a1;
                    }
                }

                // exchange, = 8
                for (i = 0; i < 4; ++i) {
                    a5 = B[ii + 4 + i][jj];
                    a6 = B[ii + 4 + i][jj+1];
                    a7 = B[ii + 4 + i][jj+2];
                    a8 = B[ii + 4 + i][jj+3];
                    a1 = B[ii + i][jj+4];
                    a2 = B[ii + i][jj+5];
                    a3 = B[ii + i][jj+6];
                    a4 = B[ii + i][jj+7];

                    B[ii + i][jj+4] = a5;
                    B[ii + i][jj+5] = a6;
                    B[ii + i][jj+6] = a7;
                    B[ii + i][jj+7] = a8;
                    B[ii + 4 + i][jj] = a1;
                    B[ii + 4 + i][jj+1] = a2;
                    B[ii + 4 + i][jj+2] = a3;
                    B[ii + 4 + i][jj+3] = a4;
                }
            }
        }
    }

    ENSURES(is_transpose(M, N, A, B));
}


char transpose_64_64_desc[] = "Transpose big sub matrix, and smaller matrix extension 5";
void transpose_64_64(int M, int N, int A[N][M], int B[M][N]){
    int ii, jj, i, j;
    int a1, a2, a3, a4, a5, a6, a7, a8;
    REQUIRES(M > 0);
    REQUIRES(N > 0);

    // we borrow (1, 57) -- (4, 64) as a higher level cache
    // diagonal
    for(ii = 0; ii < N; ii += 8) {
        for(jj = 0; jj < M; jj += 8) {
            if (ii == jj && ii != 56) {
                    // up 4 lines, = 8
                    for (i = ii; i < ii + 4; ++i) {
                        a1 = A[i][jj];
                        a2 = A[i][jj+1];
                        a3 = A[i][jj+2];
                        a4 = A[i][jj+3];
                        a5 = A[i][jj+4];
                        a6 = A[i][jj+5];
                        a7 = A[i][jj+6];
                        a8 = A[i][jj+7];

                        B[i][jj] = a1;
                        B[i][jj+1] = a2;
                        B[i][jj+2] = a3;
                        B[i][jj+3] = a4;
                        B[i][jj+4] = a5;
                        B[i][jj+5] = a6;
                        B[i][jj+6] = a7;
                        B[i][jj+7] = a8;

                        // save to cache, first time = 4 miss, else = 0 miss.
                        B[i - ii][56] = a5;
                        B[i - ii][57] = a6;
                        B[i - ii][58] = a7;
                        B[i - ii][59] = a8;
                    }
                    // up left
                    for (i = ii; i < ii + 4; ++i) {
                        for (j = i; j < jj + 4; ++j) {
                            a1 = B[i][j];
                            B[i][j] = B[j][i];
                            B[j][i] = a1;
                        }
                    }

                    // down 4 lines, = 8
                    for (i = ii + 4; i < ii + 8; ++i) {
                        a1 = A[i][jj];
                        a2 = A[i][jj+1];
                        a3 = A[i][jj+2];
                        a4 = A[i][jj+3];
                        a5 = A[i][jj+4];
                        a6 = A[i][jj+5];
                        a7 = A[i][jj+6];
                        a8 = A[i][jj+7];

                        B[i][jj] = a1;
                        B[i][jj+1] = a2;
                        B[i][jj+2] = a3;
                        B[i][jj+3] = a4;
                        B[i][jj+4] = a5;
                        B[i][jj+5] = a6;
                        B[i][jj+6] = a7;
                        B[i][jj+7] = a8;

                        // save to cache, first = 4 miss, else = 0 miss
                        B[i - ii - 4][60] = a1;
                        B[i - ii - 4][61] = a2;
                        B[i - ii - 4][62] = a3;
                        B[i - ii - 4][63] = a4;
                    }

                    // down right
                    for (i = ii + 4; i < ii + 8; ++i) {
                        for (j = i; j < jj + 8; ++j) {
                            a1 = B[i][j];
                            B[i][j] = B[j][i];
                            B[j][i] = a1;
                        }
                    }

                    // transpose 2 matrces in cache
                    for (i = 0; i < 4; ++i) {
                        for (j = 56 + i; j < 60; ++j) {
                            a1 = B[i][j];
                            B[i][j] = B[j - 56][i + 56];
                            B[j - 56][i + 56] = a1;
                        }
                    }

                    for (i = 0; i < 4; ++i) {
                        for (j = 60 + i; j < 64; ++j) {
                            a1 = B[i][j];
                            B[i][j] = B[j - 60][i + 60];
                            B[j - 60][i + 60] = a1;
                        }
                    }

                    // update to array B.
                    // left ---> down left
                    for (i = ii + 4; i < ii + 8; ++i) {
                        for (j = jj; j < jj + 4; ++j) {
                            B[i][j] = B[i - ii - 4][56 + j - jj];
                        }
                    }
                    // right --> up right
                    for (i = ii; i < ii + 4; ++i) {
                        for (j = jj + 4; j < jj + 8; ++j) {
                            B[i][j] = B[i - ii][60 + j - jj - 4];
                        }
                    }
            }
        }
    }

    for(ii = 0; ii < N; ii += 8) {
        for(jj = 0; jj < M; jj += 8) {
            if ( ii != jj ) {
                // for *up right* and *down left*
                // up 4 lines
                for (i = 0; i < 4; ++i) {
                    a1 = A[ii + i][jj];
                    a2 = A[ii + i][jj+1];
                    a3 = A[ii + i][jj+2];
                    a4 = A[ii + i][jj+3];
                    a5 = A[ii + i][jj+4];
                    a6 = A[ii + i][jj+5];
                    a7 = A[ii + i][jj+6];
                    a8 = A[ii + i][jj+7];

                    B[jj + i][ii] = a1;
                    B[jj + i][ii+1] = a2;
                    B[jj + i][ii+2] = a3;
                    B[jj + i][ii+3] = a4;
                    B[jj + i][ii+4] = a5;
                    B[jj + i][ii+5] = a6;
                    B[jj + i][ii+6] = a7;
                    B[jj + i][ii+7] = a8;
                }
                for (i = jj; i < jj + 4; ++i) {
                    for (j = ii + i - jj; j < ii + 4; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[jj + j - ii][ii + i - jj];
                        B[jj + j - ii][ii + i - jj] = a1;
                    }
                } // transpose upper left
                // down 4 lines
                for (i = 0; i < 4; ++i) {
                    a1 = B[jj + i][ii + 4];
                    a2 = B[jj + i][ii + 5];
                    a3 = B[jj + i][ii + 6];
                    a4 = B[jj + i][ii + 7];

                    a5 = A[ii + 4 + i][jj];
                    a6 = A[ii + 4 + i][jj+1];
                    a7 = A[ii + 4 + i][jj+2];
                    a8 = A[ii + 4 + i][jj+3]; // = 4 miss

                    B[jj + i][ii + 4] = a5;
                    B[jj + i][ii + 5] = a6;
                    B[jj + i][ii + 6] = a7;
                    B[jj + i][ii + 7] = a8; // = 0 miss

                    B[jj + 4 + i][ii] = a1;
                    B[jj + 4 + i][ii+1] = a2;
                    B[jj + 4 + i][ii+2] = a3;
                    B[jj + 4 + i][ii+3] = a4; // = 4 miss

                    a1 = A[ii + 4 + i][jj + 4];
                    a2 = A[ii + 4 + i][jj + 5];
                    a3 = A[ii + 4 + i][jj + 6];
                    a4 = A[ii + 4 + i][jj + 7]; // = 0 miss

                    B[jj + 4 + i][ii + 4] = a1;
                    B[jj + 4 + i][ii + 5] = a2;
                    B[jj + 4 + i][ii + 6] = a3;
                    B[jj + 4 + i][ii + 7] = a4; // = 0 miss
                }

                for (i = jj + 4; i < jj + 8; ++i) {
                    for (j = ii + i - jj; j < ii + 8; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[jj + j - ii][ii + i - jj];
                        B[jj + j - ii][ii + i - jj] = a1;
                    }
                } // transpose down right, = 0 miss

                for (i = jj + 4; i < jj + 8; ++i) {
                    for (j = ii + i - jj - 4; j < ii + 4; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[jj + 4 + j - ii][ii + i - jj - 4];
                        B[jj + 4 + j - ii][ii + i - jj - 4] = a1;
                    }
                } // down left, = 0 miss

                for (i = jj; i < jj + 4; ++i) {
                    for (j = ii + 4 + i - jj; j < ii + 8; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[jj + j - ii - 4][ii + 4 + i - jj];
                        B[jj + j - ii - 4][ii + 4 + i - jj] = a1;
                    }
                } // up right, = 4 miss
            } else if (ii == jj && ii == 56) {
                // up 4 lines, = 8
                for (i = ii; i < ii + 4; ++i) {
                    a1 = A[i][jj];
                    a2 = A[i][jj+1];
                    a3 = A[i][jj+2];
                    a4 = A[i][jj+3];
                    a5 = A[i][jj+4];
                    a6 = A[i][jj+5];
                    a7 = A[i][jj+6];
                    a8 = A[i][jj+7];

                    B[i][jj] = a1;
                    B[i][jj+1] = a2;
                    B[i][jj+2] = a3;
                    B[i][jj+3] = a4;
                    B[i][jj+4] = a5;
                    B[i][jj+5] = a6;
                    B[i][jj+6] = a7;
                    B[i][jj+7] = a8;
                }
                for (i = ii; i < ii + 4; ++i) {
                    for (j = i; j < jj + 4; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[j][i];
                        B[j][i] = a1;
                    }
                }

                for (i = ii; i < ii + 4; ++i) {
                    for (j = i + 4; j < jj + 8; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[j - 4][i + 4];
                        B[j - 4][i + 4] = a1;
                    }
                }

                // down 4 lines, = 8
                for (i = ii + 4; i < ii + 8; ++i) {
                    a1 = A[i][jj];
                    a2 = A[i][jj+1];
                    a3 = A[i][jj+2];
                    a4 = A[i][jj+3];
                    a5 = A[i][jj+4];
                    a6 = A[i][jj+5];
                    a7 = A[i][jj+6];
                    a8 = A[i][jj+7];

                    B[i][jj] = a1;
                    B[i][jj+1] = a2;
                    B[i][jj+2] = a3;
                    B[i][jj+3] = a4;
                    B[i][jj+4] = a5;
                    B[i][jj+5] = a6;
                    B[i][jj+6] = a7;
                    B[i][jj+7] = a8;
                }

                for (i = ii + 4; i < ii + 8; ++i) {
                    for (j = i; j < jj + 8; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[j][i];
                        B[j][i] = a1;
                    }
                }

                for (i = ii + 4; i < ii + 8; ++i) {
                    for (j = jj + i - ii - 4; j < jj + 4; ++j) {
                        a1 = B[i][j];
                        B[i][j] = B[j + 4][i - 4];
                        B[j + 4][i - 4] = a1;
                    }
                }

                // exchange, = 8
                for (i = 0; i < 4; ++i) {
                    a5 = B[ii + 4 + i][jj];
                    a6 = B[ii + 4 + i][jj+1];
                    a7 = B[ii + 4 + i][jj+2];
                    a8 = B[ii + 4 + i][jj+3];
                    a1 = B[ii + i][jj+4];
                    a2 = B[ii + i][jj+5];
                    a3 = B[ii + i][jj+6];
                    a4 = B[ii + i][jj+7];

                    B[ii + i][jj+4] = a5;
                    B[ii + i][jj+5] = a6;
                    B[ii + i][jj+6] = a7;
                    B[ii + i][jj+7] = a8;
                    B[ii + 4 + i][jj] = a1;
                    B[ii + 4 + i][jj+1] = a2;
                    B[ii + 4 + i][jj+2] = a3;
                    B[ii + 4 + i][jj+3] = a4;
                }
            }
        }
    }

    ENSURES(is_transpose(M, N, A, B));
}

/*
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. The REQUIRES and ENSURES from 15-122 are included
 *     for your convenience. They can be removed if you like.
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    REQUIRES(M > 0);
    REQUIRES(N > 0);

    if (M == 32 && N == 32) {
        transpose_32_32(M, N, A, B);
    } else if (M == 64 && N == 64) {
        transpose_64_64(M, N, A, B);
    } else {
        transpose_dia_block(M, N, A, B, 16, 4);
    }

    ENSURES(is_transpose(M, N, A, B));
}

/*
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started.
 */

/*
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    REQUIRES(M > 0);
    REQUIRES(N > 0);

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }

    ENSURES(is_transpose(M, N, A, B));
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc);

    /* Register any additional transpose functions */
    registerTransFunction(transpose_64_64, transpose_64_64_desc);
}

/*
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

