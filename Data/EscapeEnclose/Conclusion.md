# Conclusion related to parameters tested

#### Control Group Parameter

| Item           | Value |
| -------------- | ----- |
| maxGrowthRate1 | 1     |
| maxGrowthRate2 | 1     |
| excretionRateB | 1     |
| excretionRateA | 1     |
| **diffusion1** | 0     |
| **diffusion2** | 0     |
| diffusionB     | 10    |
| diffusionA     | 10    |
| yieldB         | 1     |
| yieldA         | 1     |
| monodConstantB | 1     |
| monodConstantA | 1     |
| **toxicityB**  | 10    |
| **toxicityA**  | 1     |

> NOTE: **Bold item** is the key value which should be fixed

#### General Conclusion

| Item | State                                                        | Parameter 1          | Parameter 2          |
| ---- | ------------------------------------------------------------ | -------------------- | -------------------- |
| 1    | [F] Type 2 is enclosed by Type 1                             | diffusionA = 1       | diffusionB = 10      |
| 2    | [F] Type 2 is enclosed by Type 1                             | diffusionA = 10      | diffusionB = 1       |
| 3    | [F] Type 2 is enclosed by Type 1, smaller                    | excretionRateA = 1   | excretionRateB = 0.1 |
| 4    | [F] Type 1 is enclosed by Type 2, smaller                    | excretionRateA = 0.1 | excretionRateB = 1   |
| 5    | **[S]** Spiral Pattern                                       | excretionRateA = 0.3 | excretionRateB = 1   |
| 6    | [F] Type 2 grows more but is still encloded Type 1           | excretionRateA = 0.5 | excretionRateB = 1   |
| 7    | [F] Type 2 grows more but is still encloded Type 1           | yieldA = 1           | yieldB = 10          |
| 8    | [F] Didn't enclosed, but grows super slow; Type 2 larger population | diffusionA = 0.5     | diffusionB = 10      |
| 9    | [F] Type 2 is enclosed by Type 1                             | yieldA = 5           | yieldB = 10          |

