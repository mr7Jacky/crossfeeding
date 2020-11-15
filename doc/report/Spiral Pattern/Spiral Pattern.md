# Spiral Pattern
##### Plan

We will test the following parameter to verify our hypothesis (All three setting have a Diffusion 1 = Diffusion 2 = 0)

1. EQUAL TOXICITY: Diffusion A = Diffusion B = 10; Toxicity A = Toxicity B = 1
2. NO TOX: Diffusion A = Diffusion B = 10; Toxicity A = Toxicity B = 0 (Mutualism mode)
3. DIFFERENT TOX: Diffusion A = Diffusion B = 10; Toxicity A = 1; Toxicity B = 10

> Note that: in No Tox condition, when we run in mutualism with toxicity and set toxicity to 0, ihe program only last for one time unit. (Only 1 output text)

#### Result
Left is NO TOX condition. Right is EQUAL TOX conditions
<p float="center">
  <img src="./src/fig/notox.gif" width="400" />
  <img src="./src/fig/eqtox.gif" width="400" /> 
</p>

In No tox case, we observe a sprial pattern, it is like an extension of strip pattren, instead of having an stripe per level, the strips all connected and form one sprial pattern. 

Interesting part is the width of the type 1 is growing faster than the width of type 2. So the population of type 1 is more than that of type 2.

In Equal toxicity cases, we observe a same pattern as No tox case, which is consistent as our expectation, as the toxicity barricate their population growth. Thus, there is much less population in equal tox pattern compare to no tox cases. Therefore, the pattern they have is a relatively small colony with sprial pattern.

#### Compare with stripe pattern

Presumably, the major difference between spiral pattern and stripe pattern is the diffusion rate of backteria. In spiral pattern, there is no diffusion of backteria and in stripe pattern, we given the diffusion rate of backteria. What the diffusion rate gives is that whether the backteria are allowed to grow only continuously or they are allowed to grow outside and form a new region of colony. In spiral pattern, they can only grow continuously. It is like we connecting various strips together into one spiral strips. In contrast, in stripe pattern, their grow are spread into multiple regions, In this way, even if one region is outof space to grow, They will not stop growing but grow in other region so that two types of backteria can co-exisiting.