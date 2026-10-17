.class public Lcom/antigravity/screenresizer/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/antigravity/screenresizer/ResizerHelper;->apply(Landroid/content/Context;Ljava/lang/String;)V

    const-string v1, "reset"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/antigravity/screenresizer/MainActivity;->finish()V

    :cond_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x11

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    const v2, -0xede7dc

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const/16 v2, 0x20

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v3, "Fire TV Screen Resizer"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v3, 0x41f00000    # 30.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v3, "Select aspect ratio mode for Fire TV\n"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v3, -0x5f4f38

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v3, 0x41800000    # 16.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v3, "16:9 Standard (Default Fullscreen)"

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const-string v3, "16:9"

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setFocusable(Z)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v4, "4:3 Retro Mode (Pillarbox Sides)"

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const-string v4, "4:3"

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v3, v1}, Landroid/widget/Button;->setFocusable(Z)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/Button;

    invoke-direct {v4, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v5, "Cinema Zoom (Crop Top/Bottom Bars)"

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const-string v5, "zoom"

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v4, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setFocusable(Z)V

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/Button;

    invoke-direct {v5, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v6, "Reset Display to Normal & Exit"

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const-string v6, "reset"

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v5, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v5, v1}, Landroid/widget/Button;->setFocusable(Z)V

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v2}, Landroid/widget/Button;->requestFocus()Z

    invoke-virtual {p0, v0}, Lcom/antigravity/screenresizer/MainActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method
