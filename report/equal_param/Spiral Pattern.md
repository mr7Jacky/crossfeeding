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

