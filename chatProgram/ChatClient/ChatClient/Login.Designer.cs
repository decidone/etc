﻿namespace ChatClient
{
    partial class Login
    {
        /// <summary>
        /// 필수 디자이너 변수입니다.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 사용 중인 모든 리소스를 정리합니다.
        /// </summary>
        /// <param name="disposing">관리되는 리소스를 삭제해야 하면 true이고, 그렇지 않으면 false입니다.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form 디자이너에서 생성한 코드

        /// <summary>
        /// 디자이너 지원에 필요한 메서드입니다. 
        /// 이 메서드의 내용을 코드 편집기로 수정하지 마세요.
        /// </summary>
        private void InitializeComponent()
        {
            this.TB_Name = new System.Windows.Forms.TextBox();
            this.btnRegister = new System.Windows.Forms.Button();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.TB_Msg = new System.Windows.Forms.TextBox();
            this.btnLogin = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // TB_Name
            // 
            this.TB_Name.Location = new System.Drawing.Point(95, 38);
            this.TB_Name.Name = "TB_Name";
            this.TB_Name.Size = new System.Drawing.Size(147, 21);
            this.TB_Name.TabIndex = 0;
            // 
            // btnRegister
            // 
            this.btnRegister.Location = new System.Drawing.Point(156, 333);
            this.btnRegister.Name = "btnRegister";
            this.btnRegister.Size = new System.Drawing.Size(83, 30);
            this.btnRegister.TabIndex = 1;
            this.btnRegister.Text = "회원가입";
            this.btnRegister.UseVisualStyleBackColor = true;
            this.btnRegister.Click += new System.EventHandler(this.btnRegister_Click);
            // 
            // richTextBox1
            // 
            this.richTextBox1.Location = new System.Drawing.Point(18, 120);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(222, 155);
            this.richTextBox1.TabIndex = 2;
            this.richTextBox1.Text = "";
            // 
            // TB_Msg
            // 
            this.TB_Msg.Location = new System.Drawing.Point(18, 306);
            this.TB_Msg.Name = "TB_Msg";
            this.TB_Msg.Size = new System.Drawing.Size(221, 21);
            this.TB_Msg.TabIndex = 3;
            // 
            // btnLogin
            // 
            this.btnLogin.Location = new System.Drawing.Point(159, 65);
            this.btnLogin.Name = "btnLogin";
            this.btnLogin.Size = new System.Drawing.Size(83, 30);
            this.btnLogin.TabIndex = 4;
            this.btnLogin.Text = "로그인";
            this.btnLogin.UseVisualStyleBackColor = true;
            this.btnLogin.Click += new System.EventHandler(this.btnLogin_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(254, 452);
            this.Controls.Add(this.btnLogin);
            this.Controls.Add(this.TB_Msg);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.btnRegister);
            this.Controls.Add(this.TB_Name);
            this.Name = "MainForm";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox TB_Name;
        private System.Windows.Forms.Button btnRegister;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.TextBox TB_Msg;
        private System.Windows.Forms.Button btnLogin;
    }
}

