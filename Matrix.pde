class Matrix {
  float m00, m01, m02;
  float m10, m11, m12;
  float m20, m21, m22;

  Matrix() {
    identify();
  }
  
  void identify() {
    m00 = 1.0; m01 = 0.0; m02 = 0.0;
    m10 = 0.0; m11 = 1.0; m12 = 0.0;
    m20 = 0.0; m21 = 0.0; m22 = 1.0;
  }
  
  void translate(float tx, float ty){
    m02 = tx;
    m12 = ty;
  }
  
  void rotate(float r){
    m00 = cos(r); m01 = -sin(r);
    m10 = sin(r); m11 = cos(r);
  }
  
  void scale(float sx, float sy){
    m00 = sx;
    m11 = sy;
  }
  
  Matrix multiply(Matrix mat){
    Matrix result = new Matrix();
        
    result.m00 = this.m00*mat.m00+this.m01*mat.m10+this.m02*mat.m20;
    result.m01 = this.m00*mat.m01+this.m01*mat.m11+this.m02*mat.m21;
    result.m02 = this.m00*mat.m02+this.m01*mat.m12+this.m02*mat.m22;
    result.m10 = this.m10*mat.m00+this.m11*mat.m10+this.m12*mat.m20;
    result.m11 = this.m10*mat.m01+this.m11*mat.m11+this.m12*mat.m21;
    result.m12 = this.m10*mat.m02+this.m11*mat.m12+this.m12*mat.m22;
    result.m20 = this.m20*mat.m00+this.m21*mat.m10+this.m22*mat.m20;
    result.m21 = this.m20*mat.m01+this.m21*mat.m11+this.m22*mat.m21;
    result.m22 = this.m20*mat.m02+this.m21*mat.m12+this.m22*mat.m22;

    return result;
  }
}
